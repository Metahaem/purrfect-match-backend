class AdopterSerializer < ActiveModel::Serializer
  attributes :id, :location
  has_many :likes
   class LikeSerializer < ActiveModel::Serializer
     attributes :id, :pet_id
   end
end
