json.extract! timesheet, :id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :start_at, :user_id, :work_order_id, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
