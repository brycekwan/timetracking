# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_09_211725) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "unit"
    t.string "city"
    t.string "province"
    t.string "postal_code"
    t.string "hst_number"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.string "description"
    t.decimal "hours"
    t.decimal "rate"
    t.decimal "amount"
    t.bigint "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.bigint "company_id", null: false
    t.string "number"
    t.date "issued_at"
    t.date "due_at"
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_invoices_on_company_id"
    t.index ["vendor_id"], name: "index_invoices_on_vendor_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "timesheets", force: :cascade do |t|
    t.decimal "sunday"
    t.decimal "monday"
    t.decimal "tuesday"
    t.decimal "wednesday"
    t.decimal "thursday"
    t.decimal "friday"
    t.decimal "saturday"
    t.datetime "start_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "invoice_id"
    t.bigint "work_order_id", null: false
    t.index ["invoice_id"], name: "index_timesheets_on_invoice_id"
    t.index ["user_id"], name: "index_timesheets_on_user_id"
    t.index ["work_order_id"], name: "index_timesheets_on_work_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "unit"
    t.string "postal_code"
    t.string "province"
    t.string "country"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_vendors_on_company_id"
  end

  create_table "work_orders", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate", default: "0.0"
    t.index ["project_id"], name: "index_work_orders_on_project_id"
    t.index ["user_id"], name: "index_work_orders_on_user_id"
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoices", "companies"
  add_foreign_key "invoices", "vendors"
  add_foreign_key "projects", "companies"
  add_foreign_key "timesheets", "invoices"
  add_foreign_key "timesheets", "users"
  add_foreign_key "timesheets", "work_orders"
  add_foreign_key "users", "companies"
  add_foreign_key "vendors", "companies"
  add_foreign_key "work_orders", "projects"
  add_foreign_key "work_orders", "users"
end
