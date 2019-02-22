class HomeSerializer < ActiveModel::Serializer
  attributes :id, :name, :user
  has_many :pets
  class PetSerializer < ActiveModel::Serializer
    attributes :id, :name, :animal, :age, :breed, :link, :location, :description, :photo, :live_with_cats, :live_with_dogs, :live_with_kids, :colour
  end
end
