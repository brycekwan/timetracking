class AddRateToWorkOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :work_orders, :rate, :decimal, default: 0.0
  end
end
