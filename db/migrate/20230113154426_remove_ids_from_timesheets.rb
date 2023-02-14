class RemoveIdsFromTimesheets < ActiveRecord::Migration[7.0]
  def change
    remove_column :timesheets, :project_id
    remove_column :timesheets, :user_id
  end
end
