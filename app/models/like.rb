class Like < ApplicationRecord
    belongs_to :pet 
    belongs_to :adopter
end
