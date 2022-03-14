class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.references :element_category, null: false, foreign_key: true
      t.string :name
      t.string :appearence
      t.float :atomic_mass
      t.float :boil
      t.float :density
      t.string :discovered_by
      t.float :melt
      t.float :molar_heat
      t.float :named_by
      t.integer :number
      t.integer :period
      t.string :source
      t.string :spectral_img
      t.text :summary
      t.string :symbol
      t.integer :xpos
      t.integer :ypos
      t.integer :shells, array: true
      t.string :electron_configuration
      t.string :electron_configuration_semantic
      t.float :electron_affinity
      t.float :electronegativity_pauling
      t.float :ionization_energies, array: true

      t.timestamps
    end
  end
end
