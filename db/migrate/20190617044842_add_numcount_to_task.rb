class AddNumcountToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :likes_count, :integer
  end
end
