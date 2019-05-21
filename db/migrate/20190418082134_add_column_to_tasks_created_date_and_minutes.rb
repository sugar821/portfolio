class AddColumnToTasksCreatedDateAndMinutes < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :updated_day, :date
    add_column :tasks, :minutes, :integer
  end
  
  def down
    remove_column :tasks, :updated_day, :date
    remove_column :tasks, :minutes, :integer
  end
end
