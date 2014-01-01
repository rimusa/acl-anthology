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

ActiveRecord::Schema.define(version: 20131229164956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "document_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  create_table "events", force: true do |t|
    t.integer  "year"
    t.integer  "venue_id"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_volumes", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "volume_id"
  end

  create_table "papers", force: true do |t|
    t.integer  "volume_id"
    t.string   "anthology_id"
    t.string   "paper_id"
    t.string   "title",        limit: 900
    t.string   "month"
    t.integer  "year"
    t.string   "address"
    t.string   "publisher"
    t.string   "pages"
    t.string   "url"
    t.string   "bibtype"
    t.string   "bibkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers_people", id: false, force: true do |t|
    t.integer "paper_id"
    t.integer "person_id"
  end

  create_table "people", force: true do |t|
    t.integer  "person_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_volumes", id: false, force: true do |t|
    t.integer "person_id"
    t.integer "volume_id"
  end

  create_table "searches", force: true do |t|
    t.text     "query_params"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "sigs", force: true do |t|
    t.string   "name"
    t.string   "sigid"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sigs_volumes", id: false, force: true do |t|
    t.integer "sig_id"
    t.integer "volume_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "guest",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.integer  "venue_id"
    t.string   "acronym"
    t.string   "name"
    t.string   "venueid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volumes", force: true do |t|
    t.string   "anthology_id"
    t.string   "title"
    t.string   "month"
    t.integer  "year"
    t.string   "address"
    t.string   "publisher"
    t.string   "url"
    t.string   "bibtype"
    t.string   "bibkey"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end