class AddHoursTotasks < ActiveRecord::Migration[5.2]
  def up
    add_column :Tasks, :hours, :integer, default: 1, null: false
  end
  
  def down
    remove_column :Tasks, :hours, :integer, default: 1, null: false
  end
end
