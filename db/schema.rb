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

ActiveRecord::Schema[7.0].define(version: 2022_10_21_163751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "expense_companies", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.decimal "percentage"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "period_id", null: false
    t.index ["company_id"], name: "index_expense_companies_on_company_id"
    t.index ["employee_id"], name: "index_expense_companies_on_employee_id"
    t.index ["period_id"], name: "index_expense_companies_on_period_id"
  end

  create_table "other_revenue", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "period_id", null: false
    t.index ["employee_id"], name: "index_other_revenue_on_employee_id"
    t.index ["period_id"], name: "index_other_revenue_on_period_id"
  end

  create_table "periods", force: :cascade do |t|
    t.date "initial_date"
    t.date "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_periods_on_company_id"
  end

  create_table "retention_deductions", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "period_id", null: false
    t.index ["employee_id"], name: "index_retention_deductions_on_employee_id"
    t.index ["period_id"], name: "index_retention_deductions_on_period_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.decimal "total_employee"
    t.decimal "total_company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "period_id", null: false
    t.index ["company_id"], name: "index_settlements_on_company_id"
    t.index ["employee_id"], name: "index_settlements_on_employee_id"
    t.index ["period_id"], name: "index_settlements_on_period_id"
  end

  create_table "wages", force: :cascade do |t|
    t.decimal "base_salary"
    t.decimal "transport_subsidy"
    t.date "initial_date"
    t.date "final_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.index ["employee_id"], name: "index_wages_on_employee_id"
  end

  add_foreign_key "employees", "companies"
  add_foreign_key "expense_companies", "companies"
  add_foreign_key "expense_companies", "employees"
  add_foreign_key "expense_companies", "periods"
  add_foreign_key "other_revenue", "employees"
  add_foreign_key "other_revenue", "periods"
  add_foreign_key "periods", "companies"
  add_foreign_key "retention_deductions", "employees"
  add_foreign_key "retention_deductions", "periods"
  add_foreign_key "settlements", "companies"
  add_foreign_key "settlements", "employees"
  add_foreign_key "settlements", "periods"
  add_foreign_key "wages", "employees"
end
