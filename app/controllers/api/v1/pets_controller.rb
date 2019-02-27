class Api::V1::PetsController < ApplicationController
    before_action :find_pet, only: [:show, :edit, :update, :destroy]
    def index
        @pets = Pet.all
        render json: @pets
      end
    
      def show
        render json: @pet
      end

      def new
        @pet = pet.new
      end
    
      def create
        @pet = Pet.new(name: params[:name])
        if @pet.valid? && @pet.save
            render json: { pet: PetSerializer.new(@pet) }, status: :created        
        else
          render json: {error: "Unable to create pet."}, status: :not_acceptable
        end
      end

      def destroy
        @pet.destroy
        redirect_to pets_path
      end

      def scrape
        BlueCross.scrape
      end

    
      private
    
        def pet_params
          params.permit(:name, :id)
        end
    
        def find_pet
          @pet = Pet.find(params[:id])
        end
end

