class ModifyTimesheets < ActiveRecord::Migration[7.0]
  def change
    remove_reference :timesheets, :project, index: true, foreign_key: true
    add_reference :timesheets, :work_order, index: true, foreign_key: true, null: false
  end
end
