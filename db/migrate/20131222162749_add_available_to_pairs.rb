class AddAvailableToPairs < ActiveRecord::Migration
  def change
    add_column :pairs, :available, :boolean
		add_index :pairs, :available
  end
end
