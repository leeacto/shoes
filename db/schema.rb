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

ActiveRecord::Schema.define(version: 20131222163307) do

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "pairs", force: true do |t|
    t.text     "brand"
    t.integer  "year"
    t.string   "model"
    t.string   "nickname"
    t.integer  "condition"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "available",   default: false
  end

  add_index "pairs", ["available"], name: "index_pairs_on_available", using: :btree
  add_index "pairs", ["brand"], name: "index_pairs_on_brand", using: :btree
  add_index "pairs", ["condition"], name: "index_pairs_on_condition", using: :btree
  add_index "pairs", ["model"], name: "index_pairs_on_model", using: :btree
  add_index "pairs", ["nickname"], name: "index_pairs_on_nickname", using: :btree
  add_index "pairs", ["year"], name: "index_pairs_on_year", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
