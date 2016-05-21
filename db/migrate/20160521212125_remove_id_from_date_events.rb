class RemoveIdFromDateEvents < ActiveRecord::Migration
  def change
    remove_column :date_events, :event_id, :integer
    remove_column :date_events, :user_id, :integer
  end
end
