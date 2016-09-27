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

ActiveRecord::Schema.define(version: 20160927140136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string  "name"
    t.integer "number_of_teams"
    t.integer "players_per_team"
    t.boolean "playing"
  end

  create_table "links", force: :cascade do |t|
    t.integer "game_id"
    t.integer "team_id"
    t.integer "player_number"
    t.integer "series"
    t.integer "question_id"
  end

  create_table "lobbies", force: :cascade do |t|
    t.string  "name"
    t.integer "teacher_id"
    t.integer "player_count"
    t.integer "game_id"
    t.boolean "playing"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.string "answer"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "player_number"
    t.integer  "lobby_id"
    t.integer  "device_id"
    t.integer  "team_id"
    t.boolean  "playing"
    t.integer  "teacher_id"
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
    t.integer  "game_id"
    t.index ["email"], name: "index_students_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "game_id"
    t.integer "lobby_id"
  end

end
