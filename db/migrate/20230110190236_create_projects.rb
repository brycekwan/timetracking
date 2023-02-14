class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :description
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
