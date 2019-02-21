class LikeSerializer < ActiveModel::Serializer
  attributes :id, :adopter_id, :pet_id
  belongs_to :pet 
  belongs_to :adopter
end