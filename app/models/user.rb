class User < ApplicationRecord
    has_many :adopters
    has_many :homes

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
