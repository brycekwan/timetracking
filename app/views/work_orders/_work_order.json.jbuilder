json.extract! work_order, :id, :start_at, :end_at, :project_id, :user_id, :created_at, :updated_at
json.url work_order_url(work_order, format: :json)
