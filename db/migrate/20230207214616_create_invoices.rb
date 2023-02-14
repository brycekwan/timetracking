class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :vendor, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :number
      t.date :issued_at
      t.date :due_at
      t.string :term

      t.timestamps
    end
  end
end
