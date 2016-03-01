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

ActiveRecord::Schema.define(version: 20160217093446) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",     limit: 1,   default: true
    t.integer  "order",      limit: 4
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "transaction_id", limit: 4
    t.decimal  "price",                      precision: 10
    t.integer  "quantity",       limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "name",           limit: 255
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "category_id",  limit: 4
    t.decimal  "price",                    precision: 10
    t.boolean  "active",       limit: 1
    t.integer  "inventory_id", limit: 4
    t.integer  "item",         limit: 4
    t.boolean  "set",          limit: 1
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal  "amount",                 precision: 10
    t.integer  "type_id",    limit: 4
    t.string   "notes",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "void",       limit: 1,                  default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "role_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "token",           limit: 255
    t.boolean  "activated",       limit: 1
    t.boolean  "admin",           limit: 1
  end

end
