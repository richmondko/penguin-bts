# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150325053522) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "bill_of_lading_and_vans", force: :cascade do |t|
    t.date     "bl_date"
    t.string   "supplier"
    t.string   "shipping_line"
    t.string   "vessel"
    t.string   "voyage"
    t.string   "bl_number"
    t.string   "van_number"
    t.string   "product"
    t.string   "reference_number"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "customer_code"
    t.string   "customer_name"
    t.string   "address"
    t.string   "contact_numbers"
    t.string   "tin_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "direct_purchases", force: :cascade do |t|
    t.date     "purchase_date"
    t.string   "supplier"
    t.string   "product"
    t.integer  "quantity"
    t.decimal  "unit_cost",         precision: 10, scale: 2
    t.decimal  "commission_rate",   precision: 10, scale: 2
    t.decimal  "total_unit_cost",   precision: 10, scale: 2
    t.decimal  "liens_cost",        precision: 10, scale: 2
    t.decimal  "insurance_cost",    precision: 10, scale: 2
    t.decimal  "storage_cost",      precision: 10, scale: 2
    t.decimal  "penalty_cost",      precision: 10, scale: 2
    t.decimal  "witholding_tax",    precision: 10, scale: 2
    t.decimal  "commission_amount", precision: 10, scale: 2
    t.decimal  "payable_gross",     precision: 10, scale: 2
    t.decimal  "payable_net",       precision: 10, scale: 2
    t.string   "reference_number"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "liens", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.decimal  "cost",       precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "liens", ["product_id"], name: "index_liens_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "item_code"
    t.string   "item_name"
    t.string   "item_type"
    t.string   "central_name"
    t.string   "origin"
    t.string   "class_type"
    t.decimal  "unit_cost",    precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "salesmen", force: :cascade do |t|
    t.string   "salesman_code"
    t.string   "salesman_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "supplier_code"
    t.string   "supplier_name"
    t.string   "supplier_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
