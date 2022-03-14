class AddPhaseToElements < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL 
      CREATE TYPE element_phase AS ENUM ('Solid', 'Liquid', 'Gas');
    SQL

    add_column :elements, :phase, :element_phase
    add_index  :elements, :phase
  end

  def down
    remove_column :elements, :phase
    execute <<-SQL 
      DROP TYPE element_phase;
    SQL
  end
end
