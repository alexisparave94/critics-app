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

ActiveRecord::Schema[7.0].define(version: 2022_09_17_181230) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.string "country"
    t.integer "critics_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "games_count", default: 0
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.date "release_date"
    t.integer "category"
    t.decimal "rating"
    t.integer "critics_count", default: 0
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
    t.index ["parent_id"], name: "index_games_on_parent_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "involved_companies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "game_id", null: false
    t.boolean "developer"
    t.boolean "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id", "game_id"], name: "index_involved_companies_on_company_id_and_game_id", unique: true
    t.index ["company_id"], name: "index_involved_companies_on_company_id"
    t.index ["game_id"], name: "index_involved_companies_on_game_id"
  end

  add_foreign_key "games", "games", column: "parent_id"
  add_foreign_key "involved_companies", "companies"
  add_foreign_key "involved_companies", "games"
end
