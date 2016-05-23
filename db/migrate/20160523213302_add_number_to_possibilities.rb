class AddNumberToPossibilities < ActiveRecord::Migration
  def change
    add_column :possibilities, :number, :integer
  end
end
