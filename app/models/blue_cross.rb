require 'nokogiri'
require 'open-uri'


class BlueCross < ApplicationRecord
    
    def self.get_home_id
        Home.all.find{|home| home.name == "Blue Cross"}.id
    end
    
    def self.get_page(animal_type)
        
        Nokogiri::HTML(open("https://www.bluecross.org.uk/rehome/#{animal_type}"))
    end

    def self.get_info_from_front_page(animal_data)
        
        @animal_url = "https://www.bluecross.org.uk#{animal_data["href"]}"
        @name = animal_data.css(".item__title").text
        @breed = animal_data.css(".item__body").children[1].text
        @sex = animal_data.css(".item__body").children[3].text
        @age = animal_data.css(".item__body").children[5].text.gsub(/\n/, "").gsub(/\t/, "").strip
    end

    def self.get_data_from_individual_pet_page
        
        @page_data = Nokogiri::HTML(open(@animal_url))
        @photo = @page_data.at_css('.img-w-border').children[1]['src']
        
        @description = @page_data.at_css(".column-main").text.gsub(/\n/, "").strip.split(' ')[2..-1].join(' ')
        
        #looks for colour words in general description on page
        @colour = @page_data.at_css(".pet-details_species").text.gsub(/\n/, "").strip.split(" ").select{|word| Colours.all.include?(word.downcase)}.join(", ")
    end

    def self.get_location_data
        
        location_page = "https://www.bluecross.org.uk#{@page_data.at_css(".pet-details_location").children[1]["href"]}"
        loc_page_data = Nokogiri::HTML(open(location_page))
        @location = loc_page_data.at_css(".location-details").children[1].children.last.children.last.children.text
    end

    def self.refine_single_animal_data(animal_data)
        self.get_info_from_front_page(animal_data)
        
        self.get_data_from_individual_pet_page
        self.get_location_data        
    end

    def self.pet_hash(animal_data)
        self.refine_single_animal_data(animal_data)
        
        return {name: @name, animal: @breed, location: @location, description: @description, age: @age, link: @animal_url, photo: @photo, colour: @colour, home_id: self.get_home_id, animal: ""}
    end

    def self.get_array_of_animals(animal_type)
        @animals = self.get_page(animal_type).css(".item__link")
        
        #filter out reserved animals
        @animals = @animals.select{|animal| animal.css(".banner--reserved").length == 0}
    end

    #scrape one of dogs or cats and create new Pets from the data
    def self.scrape_one_animal_type(animal_type)
        
        self.get_array_of_animals(animal_type)
        @animals.each do 
            |animal_data| pet = self.pet_hash(animal_data) 
            pet[:animal] = animal_type
            
            Pet.create!(pet)
        end 
    end

    #scrape both dogs and cats and create new Pets from the data
    def self.scrape
        Pet.destroy_all
        ["dog", "cat"].each{|animal| self.scrape_one_animal_type(animal)}
        
    end

end





