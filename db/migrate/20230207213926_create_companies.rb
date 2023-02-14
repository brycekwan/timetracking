class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :unit
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :hst_number
      t.string :country

      t.timestamps
    end
  end
end
