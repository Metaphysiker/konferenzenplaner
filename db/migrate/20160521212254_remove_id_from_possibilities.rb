class RemoveIdFromPossibilities < ActiveRecord::Migration
  def change
    remove_column :possibilities, :number, :integer
  end
end
