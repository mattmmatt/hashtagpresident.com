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

ActiveRecord::Schema.define(version: 20151111233520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "party"
    t.string   "twitter_url"
    t.integer  "followers"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "twitter_handle"
  end

  create_table "follower_counts", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "twitter_followers"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "follower_counts", ["candidate_id"], name: "index_follower_counts_on_candidate_id", using: :btree

  add_foreign_key "follower_counts", "candidates"
end
