json.extract! task, :id, :text, :creator, :completed_at, :completed_from, :created_at, :updated_at
json.url task_url(task, format: :json)
