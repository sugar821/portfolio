require 'csv'

    CSV.generate do |csv|
      column_names = %w(title start_time finish_time complete category.name)
      csv << column_names
      @tasks.each do |task|
        column_values = [
          task.title,
          task.start_time,
          task.finish_time,
          task.complete,
          task.user&.id,
          task.category&.name
        ]
        csv << column_values
        end
    end
