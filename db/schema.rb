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

ActiveRecord::Schema.define(version: 20170711070600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_images", force: :cascade do |t|
    t.string "image"
    t.string "description"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_images_on_album_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "waypoint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["waypoint_id"], name: "index_albums_on_waypoint_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "coverphoto"
    t.bigint "waypoint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["waypoint_id"], name: "index_entries_on_waypoint_id"
  end

  create_table "friends", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.string "email"
    t.string "coverphoto"
    t.bigint "waypoint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["waypoint_id"], name: "index_friends_on_waypoint_id"
  end

  create_table "globes", force: :cascade do |t|
    t.float "lat"
    t.float "lng"
    t.integer "zoom"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_globes_on_user_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "coverphoto"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "description"
    t.boolean "admin", default: false
    t.string "profile_pic"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "home_country"
    t.string "home_state"
    t.string "home_city"
    t.string "current_country"
    t.string "current_state"
    t.string "current_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  create_table "waypoints", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "coverphoto"
    t.datetime "date"
    t.bigint "journey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_waypoints_on_journey_id"
  end

  add_foreign_key "album_images", "albums"
  add_foreign_key "albums", "waypoints"
  add_foreign_key "entries", "waypoints"
  add_foreign_key "friends", "waypoints"
  add_foreign_key "globes", "users"
  add_foreign_key "journeys", "users"
  add_foreign_key "waypoints", "journeys"
end
