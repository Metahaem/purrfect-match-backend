class Home < ApplicationRecord
    belongs_to :user
    has_many :pets
 
end
