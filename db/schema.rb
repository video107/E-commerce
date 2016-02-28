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

ActiveRecord::Schema.define(version: 20160228072603) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_name"
    t.string   "order_phone"
    t.text     "order_address"
    t.string   "order_email"
    t.string   "payment_method"
    t.string   "status"
    t.integer  "gold_count",     default: 0
    t.integer  "rose_count",     default: 0
    t.integer  "silver_count",   default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "product_id"
    t.integer  "total_amount",   default: 0
  end

  create_table "products", force: :cascade do |t|
    t.integer  "gold_stock",   default: 0
    t.integer  "rose_stock",   default: 0
    t.integer  "silver_stock", default: 0
    t.integer  "gold_price",   default: 50
    t.integer  "rose_price",   default: 50
    t.integer  "silver_price", default: 50
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
