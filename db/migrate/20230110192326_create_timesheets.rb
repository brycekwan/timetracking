class CreateTimesheets < ActiveRecord::Migration[7.0]
  def change
    create_table :timesheets do |t|
      t.decimal :sunday
      t.decimal :monday
      t.decimal :tuesday
      t.decimal :wednesday
      t.decimal :thursday
      t.decimal :friday
      t.decimal :saturday
      t.datetime :start_at
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
