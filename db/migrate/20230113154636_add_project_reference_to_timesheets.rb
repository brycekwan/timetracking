class AddProjectReferenceToTimesheets < ActiveRecord::Migration[7.0]
  def change
    add_reference :timesheets, :project, null: false, foreign_key: true
  end
end
