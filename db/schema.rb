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

ActiveRecord::Schema.define(version: 2019_07_09_124353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_data", force: :cascade do |t|
    t.string "drag_name"
    t.string "treatment_name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_card_data_on_category_id"
  end

  create_table "card_values", force: :cascade do |t|
    t.string "value_type"
    t.float "value"
    t.bigint "card_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_datum_id"], name: "index_card_values_on_card_datum_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_favorit", default: false
    t.string "category_type"
  end

  add_foreign_key "card_values", "card_data"
end
