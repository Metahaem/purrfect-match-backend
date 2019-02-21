class AdopterSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :location, :admin
  has_many :likes
   class LikeSerializer < ActiveModel::Serializer
     attributes :id, :pet_id
   end
end
