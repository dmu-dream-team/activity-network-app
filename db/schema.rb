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

ActiveRecord::Schema.define(version: 2019_02_23_013739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clusters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.string "synonyms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.integer "interest_id"
    t.integer "user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "nyko_id", null: false
    t.string "nyko_name", null: false
    t.string "friendly_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "string"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number", null: false
    t.string "address"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.bigint "event_id"
    t.bigint "cluster_id"
    t.boolean "rsvp", default: false
    t.string "state"
    t.index ["cluster_id"], name: "index_users_on_cluster_id"
    t.index ["event_id"], name: "index_users_on_event_id"
    t.index ["location_id"], name: "index_users_on_location_id"
  end

  add_foreign_key "messages", "users"
  add_foreign_key "users", "clusters"
  add_foreign_key "users", "events"
  add_foreign_key "users", "locations"
end
