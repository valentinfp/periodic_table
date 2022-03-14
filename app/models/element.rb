class Element < ApplicationRecord
  belongs_to :category, class_name: "ElementCategory", foreign_key: "element_category_id", optional: true

  enum phase: {solid: 'Solid', liquid: 'Liquid', gas: 'Gas'}

  validates :number, :uniqueness =>  true

  def self.find_by_position(x, y)
    find_by(xpos: x, ypos: y)
  end
end
