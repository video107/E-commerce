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

ActiveRecord::Schema.define(version: 20160314212021) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_name",     limit: 255
    t.string   "order_phone",    limit: 255
    t.text     "order_address",  limit: 65535
    t.string   "order_email",    limit: 255
    t.string   "payment_method", limit: 255
    t.string   "status",         limit: 255
    t.integer  "gold_count",     limit: 4,     default: 0
    t.integer  "rose_count",     limit: 4,     default: 0
    t.integer  "silver_count",   limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "product_id",     limit: 4
    t.integer  "total_amount",   limit: 4,     default: 0
  end

  create_table "products", force: :cascade do |t|
    t.integer  "gold_stock",   limit: 4,   default: 0
    t.integer  "rose_stock",   limit: 4,   default: 0
    t.integer  "silver_stock", limit: 4,   default: 0
    t.integer  "gold_price",   limit: 4,   default: 50
    t.integer  "rose_price",   limit: 4,   default: 50
    t.integer  "silver_price", limit: 4,   default: 50
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name",         limit: 255
  end

end
