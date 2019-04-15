class RemoveStartFinishTimeFromTasks < ActiveRecord::Migration[5.2]
  #あくまでタスク管理なのでカラムを削除する。代わりにhoursで作業時間を記録する。
  def up
    remove_column :tasks, :start_time, :datetime, null:false
    remove_column :tasks, :finish_time, :datetime, null:false
  end
  
  def down
    add_column :tasks, :start_time, :datetime, null:false
    add_column :tasks, :finish_time, :datetime, null:false
  end
end
