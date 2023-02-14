class AddCompanyRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :company, foreign_key: true, null: true

    User.update_all company_id: Company.all.first.id

    change_column_null :users, :company_id, false
  end
end
