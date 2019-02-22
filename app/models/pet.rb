class Pet < ApplicationRecord
    belongs_to :home
    has_many :likes
    has_many :adopters, through: :likes
end
