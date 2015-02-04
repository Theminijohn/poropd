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

ActiveRecord::Schema.define(version: 20150204174644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "tier"
    t.string   "server"
    t.string   "division"
    t.string   "league_ign"
    t.string   "division_name"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "league_id"
    t.integer  "league_points"
    t.boolean  "is_veteran",     default: false
    t.boolean  "is_inactive",    default: false
    t.boolean  "is_hot_streak",  default: false
    t.boolean  "is_fresh_blood", default: false
    t.integer  "streamer_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "accounts", ["league_id"], name: "index_accounts_on_league_id", using: :btree
  add_index "accounts", ["league_ign"], name: "index_accounts_on_league_ign", using: :btree
  add_index "accounts", ["streamer_id"], name: "index_accounts_on_streamer_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "league_id"
    t.string   "plaintext"
    t.string   "name"
    t.string   "group"
    t.text     "description"
    t.string   "image"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "items", ["league_id"], name: "index_items_on_league_id", using: :btree
  add_index "items", ["name"], name: "index_items_on_name", using: :btree
  add_index "items", ["slug"], name: "index_items_on_slug", using: :btree

  create_table "streamers", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "user_id"
    t.string   "twitch_username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "streamers", ["name"], name: "index_streamers_on_name", using: :btree
  add_index "streamers", ["slug"], name: "index_streamers_on_slug", using: :btree
  add_index "streamers", ["twitch_username"], name: "index_streamers_on_twitch_username", using: :btree
  add_index "streamers", ["user_id"], name: "index_streamers_on_user_id", using: :btree

end
