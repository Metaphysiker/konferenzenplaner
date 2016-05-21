class CreatePossibilities < ActiveRecord::Migration
  def change
    create_table :possibilities do |t|
      t.integer :number
      t.integer :user_id
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
