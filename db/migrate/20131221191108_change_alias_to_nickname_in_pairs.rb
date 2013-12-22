class ChangeAliasToNicknameInPairs < ActiveRecord::Migration
  def change
		rename_column :pairs, :alias, :nickname
  end
end
