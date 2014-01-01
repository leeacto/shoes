class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :pair_id
      t.string :url
      t.integer :ordinal, default: 1

      t.timestamps
    end

		add_index :photos, :pair_id
  end
end
