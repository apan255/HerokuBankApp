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

ActiveRecord::Schema.define(version: 20170223012230) do

  create_table "accountreqs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "account_num"
    t.integer "user_id",     null: false
    t.text    "status",      null: false
    t.date    "created_at"
    t.date    "updated_at"
    t.float   "balance"
  end

  add_index "accounts", ["id"], name: "sqlite_autoindex_accounts_1", unique: true

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friend_id"
    t.text    "created_at", null: false
    t.text    "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "email"
    t.text     "name"
  end

# Could not dump table "transactions" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "name"
    t.text "password_digest"
    t.text "created_at",                    null: false
    t.text "updated_at",                    null: false
    t.text "admin",           default: "0", null: false
  end

end
