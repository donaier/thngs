# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_21_125519) do

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.integer "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.integer "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "board_id"
    t.integer "sort"
  end

  create_table "lnks", force: :cascade do |t|
    t.integer "list_id"
    t.text "text"
    t.text "href"
    t.integer "creator"
    t.datetime "completed_at"
    t.integer "completed_from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "board_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "list_id"
    t.text "text"
    t.integer "creator"
    t.datetime "completed_at"
    t.integer "completed_from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "flg_tomorrow"
    t.integer "nbr_prio"
    t.integer "board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "wants_help", default: true
    t.integer "home_board_id"
    t.string "theme"
    t.string "board_time"
    t.integer "extra_board_id"
    t.string "extra_time"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
