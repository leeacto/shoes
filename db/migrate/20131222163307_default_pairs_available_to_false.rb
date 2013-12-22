class DefaultPairsAvailableToFalse < ActiveRecord::Migration
  def change
		change_column_default(:pairs, :available, false)
  end
end
