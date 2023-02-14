class AddUserReferenceToTimesheets < ActiveRecord::Migration[7.0]
  def change
    add_reference :timesheets, :user, null: false, foreign_key: true
  end
end
