class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.datetime :start_time
      t.datetime :finish_time
      t.boolean :complete

      t.timestamps
    end
  end
end
