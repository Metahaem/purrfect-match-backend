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

ActiveRecord::Schema.define(version: 2019_02_21_111131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adopters", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "location"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "user", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "adopter_id"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "animal"
    t.string "location"
    t.integer "age"
    t.string "link"
    t.string "photo"
    t.text "description"
    t.boolean "live_with_cats", default: false
    t.boolean "live_with_dogs", default: false
    t.boolean "live_with_kids", default: false
    t.string "colour"
    t.integer "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
