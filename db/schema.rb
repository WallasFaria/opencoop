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

ActiveRecord::Schema.define(version: 2019_10_19_062441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "zipcode"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "associates", force: :cascade do |t|
    t.string "name"
    t.string "date_of_birth"
    t.string "marital_status"
    t.string "nationality"
    t.string "profession"
    t.string "telephone"
    t.string "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cooperatives", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "short_description"
    t.bigint "segment_id", null: false
    t.integer "minimum_of_associates"
    t.decimal "value_minimum_to_start", precision: 11, scale: 2
    t.text "indicators"
    t.integer "development_time_in_days"
    t.decimal "share_capital", precision: 11, scale: 2
    t.string "video_url"
    t.integer "status"
    t.integer "founder_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["segment_id"], name: "index_cooperatives_on_segment_id"
  end

  create_table "segments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cooperatives", "segments"
end
