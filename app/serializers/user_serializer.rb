class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :adopters 
    AdopterSerializer < ActiveModel::Serializer
      attributes :id, :location
    end
  has_many :homes 
    HomeSerializer < ActiveModel::Serializer
      attributes :id, :external
    end 
end
