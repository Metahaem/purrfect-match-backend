class Adopter < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :pets, through: :likes

end
