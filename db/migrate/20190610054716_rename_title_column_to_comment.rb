class RenameTitleColumnToComment < ActiveRecord::Migration[5.2]
  def change
     rename_column :reviews, :title, :comment
  end
end
