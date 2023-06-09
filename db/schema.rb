# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_20_181511) do

  create_table "date_comments", force: :cascade do |t|
    t.integer "trip_date_id"
    t.string "body"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "date_votes", force: :cascade do |t|
    t.integer "downvotes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "upvotes"
    t.integer "date_id"
    t.integer "user_id"
  end

  create_table "datetables", force: :cascade do |t|
    t.date "date"
    t.integer "upvotes"
    t.integer "downvotes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "trip"
    t.string "image"
    t.string "description"
    t.string "votes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "historicals", force: :cascade do |t|
    t.date "date"
    t.string "winning_team"
    t.string "losing_team"
    t.string "punishment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "location_comments", force: :cascade do |t|
    t.integer "location_id"
    t.string "body"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "location_votes", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "downvotes"
    t.integer "upvotes"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "hometown"
    t.string "bio"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "upcomings", force: :cascade do |t|
    t.string "location"
    t.string "image"
    t.string "price_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "downvote"
    t.integer "upvote"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
  end

end
