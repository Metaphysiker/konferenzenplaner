class RemoveUserIdFromPossibilities < ActiveRecord::Migration
  def change
    remove_column :possibilities, :user_id, :integer
  end
end
