class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.string :description
      t.decimal :hours
      t.decimal :rate
      t.decimal :amount
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
