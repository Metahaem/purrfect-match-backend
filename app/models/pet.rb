class Pet < ApplicationRecord
    belongs_to :home
    has_many :likes
end
