class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
