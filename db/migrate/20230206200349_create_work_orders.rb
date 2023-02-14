class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
