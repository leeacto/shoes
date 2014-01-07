class AddShotToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :shot, :string
  end
end
