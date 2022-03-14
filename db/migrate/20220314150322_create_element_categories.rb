class CreateElementCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :element_categories do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
