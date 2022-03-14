class Element < ApplicationRecord
  belongs_to :category, class_name: "ElementCategory", foreign_key: "element_category_id"

  enum phase: {solid: 'Solid', liquid: 'Liquid', gas: 'Gas'}

  validates :number, :uniqueness =>  true
end
