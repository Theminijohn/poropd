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

ActiveRecord::Schema.define(version: 20150204185346) do

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
    t.integer  "total_champion_kills"
    t.integer  "total_minion_kills"
    t.integer  "total_turrets_killed"
    t.integer  "total_neutral_minions_killed"
    t.integer  "total_assists"
    t.integer  "league_id"
    t.integer  "league_points"
    t.boolean  "is_veteran",                   default: false
    t.boolean  "is_inactive",                  default: false
    t.boolean  "is_hot_streak",                default: false
    t.boolean  "is_fresh_blood",               default: false
    t.integer  "streamer_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "accounts", ["league_id"], name: "index_accounts_on_league_id", using: :btree
  add_index "accounts", ["league_ign"], name: "index_accounts_on_league_ign", using: :btree
  add_index "accounts", ["streamer_id"], name: "index_accounts_on_streamer_id", using: :btree

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

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

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

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
