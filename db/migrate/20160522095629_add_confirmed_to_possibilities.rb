class AddConfirmedToPossibilities < ActiveRecord::Migration
  def change
    add_column :possibilities, :confirmed, :boolean, :default => false
    add_column :possibilities, :default, :string
  end
end
