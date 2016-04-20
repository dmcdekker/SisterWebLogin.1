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

ActiveRecord::Schema.define(version: 20160420040314) do

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "userblog_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["userblog_id"], name: "index_comments_on_userblog_id"

  create_table "comments", force: :cascade do |t|
    t.text    "posts"
    t.integer "user_id"
  end

  create_table "events", force: :cascade do |t|
    t.text     "what"
    t.text     "where"
    t.datetime "when"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userblogs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "userblogs", ["user_id"], name: "index_userblogs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "school_or_workplace"
    t.text     "technical_expertise"
    t.text     "still_learning"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
