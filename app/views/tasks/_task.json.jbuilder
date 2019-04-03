json.extract! task, :id, :title, :start_time, :finish_time, :complete, :created_at, :updated_at
json.url task_url(task, format: :json)
