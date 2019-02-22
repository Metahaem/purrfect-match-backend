class Adopter < ApplicationRecord
    has_many :likes
    has_many :pets, through: :likes
    has_secure_password
    validates :name, uniqueness: { case_sensitive: false }
end
