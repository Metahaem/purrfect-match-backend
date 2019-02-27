class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :adopters 
    class AdopterSerializer < ActiveModel::Serializer
      attributes :id, :location
    end
  has_many :homes 
    class HomeSerializer < ActiveModel::Serializer
      attributes :id, :external
    end 
end
