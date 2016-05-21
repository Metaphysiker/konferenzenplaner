class CreateDateEvents < ActiveRecord::Migration
  def change
    create_table :date_events do |t|
      t.date :date
      t.integer :event_id
      t.integer :user_id
      t.integer :possibility_id

      t.timestamps null: false
    end
  end
end
