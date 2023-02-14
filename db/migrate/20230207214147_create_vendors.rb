class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :address
      t.string :city
      t.string :unit
      t.string :postal_code
      t.string :province
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
