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

ActiveRecord::Schema.define(version: 2020_02_13_092611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resort_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resort_id"], name: "index_favorites_on_resort_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.bigint "resort_id", null: false
    t.string "issued_day"
    t.string "issued_date"
    t.string "forecast_day"
    t.string "time_of_day"
    t.integer "max_temperature"
    t.integer "min_temperature"
    t.string "wind_direction"
    t.integer "wind_speed"
    t.integer "snow_amount"
    t.string "weather"
    t.integer "rain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resort_id"], name: "index_forecasts_on_resort_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "resort_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resort_id"], name: "index_questions_on_resort_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "resorts", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.string "address"
    t.string "town"
    t.string "phone_number"
    t.string "url"
    t.integer "adult_price"
    t.integer "child_price"
    t.date "season_start"
    t.date "season_end"
    t.integer "top_elevation"
    t.integer "bottom_elevation"
    t.boolean "ski_school"
    t.boolean "child_care"
    t.integer "courses"
    t.integer "lifts"
    t.integer "advanced"
    t.integer "beginner"
    t.integer "intermediate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "favorites", "resorts"
  add_foreign_key "favorites", "users"
  add_foreign_key "forecasts", "resorts"
  add_foreign_key "questions", "resorts"
  add_foreign_key "questions", "users"
end
