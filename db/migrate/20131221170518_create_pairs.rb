class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.text :brand
      t.integer :year
      t.string :model
      t.string :alias
      t.integer :condition
      t.text :description

      t.timestamps
    end

		add_index :pairs, :brand
		add_index :pairs, :year
		add_index :pairs, :model
		add_index :pairs, :alias
		add_index :pairs, :condition

  end
end
