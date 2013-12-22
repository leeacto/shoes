class AddUserIdToPairs < ActiveRecord::Migration
  def change
		add_column :pairs, :user_id, :integer
  end
end
