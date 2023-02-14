class ModifyProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :projects, :user, foreign_key: true
    add_reference :projects, :company, foreign_key: true, null: true

    Project.update_all company_id: Company.all.first.id

    change_column_null :projects, :company_id, false
  end
end
