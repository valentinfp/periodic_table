class ElementCategory < ApplicationRecord
    has_many :elements
     
    validates :name, uniqueness: true
end
