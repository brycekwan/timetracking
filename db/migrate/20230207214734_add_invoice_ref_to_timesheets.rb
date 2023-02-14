class AddInvoiceRefToTimesheets < ActiveRecord::Migration[7.0]
  def change
    add_reference :timesheets, :invoice, null: true, foreign_key: true
  end
end
