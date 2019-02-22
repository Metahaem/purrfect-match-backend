class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :location, :breed, :age, :link, :description, :photo, :live_with_cats, :live_with_dogs, :live_with_kids, :colour
  belongs_to :home
  has_many :likes
  class LikeSerializer < ActiveModel::Serializer
    attributes :id, :adopter_id
  end
end
