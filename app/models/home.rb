class Home < ApplicationRecord
    has_many :pets
    has_secure_password
    validates :name, uniqueness: { case_sensitive: false }
end
