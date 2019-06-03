require 'csv'

    CSV.generate do |csv|
      column_names = %w(title minutes complete nick_name created_at category)
      csv << column_names
      @tasks.each do |task|
        column_values = [
          task.title,
          task.minutes,
          task.complete,
          task.user.nick_name,
          task.created_at,
          task.category.name
        ]
        csv << column_values
        end
    end
