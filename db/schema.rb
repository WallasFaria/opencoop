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

ActiveRecord::Schema.define(version: 2019_10_20_150530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal "balance", precision: 20, scale: 4, default: "0.0"
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_accounts_on_owner_type_and_owner_id"
  end

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

  create_table "assemblies", force: :cascade do |t|
    t.decimal "value_to_split", precision: 20, scale: 2
    t.date "pre_assembly_date"
    t.date "voting_date"
    t.bigint "cooperative_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["cooperative_id"], name: "index_assemblies_on_cooperative_id"
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

  create_table "cooperations", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.bigint "associate_id", null: false
    t.decimal "share_capital", precision: 11, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["associate_id"], name: "index_cooperations_on_associate_id"
    t.index ["cooperative_id"], name: "index_cooperations_on_cooperative_id"
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
    t.decimal "share_capital", precision: 11, scale: 2, default: "0.0"
    t.string "video_url"
    t.integer "status"
    t.integer "founder_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "cost_per_transaction", precision: 4, scale: 2
    t.index ["segment_id"], name: "index_cooperatives_on_segment_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "type"
    t.decimal "value", precision: 11, scale: 4
    t.bigint "account_id", null: false
    t.string "operable_type", null: false
    t.bigint "operable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_operations_on_account_id"
    t.index ["operable_type", "operable_id"], name: "index_operations_on_operable_type_and_operable_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "assembly_id", null: false
    t.string "owner_name"
    t.string "optionl_1_name"
    t.decimal "optionl_1_percent", precision: 5, scale: 2
    t.string "optionl_2_name"
    t.decimal "optionl_2_percent", precision: 5, scale: 2
    t.integer "total_votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assembly_id"], name: "index_proposals_on_assembly_id"
  end

  create_table "segments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string "description"
    t.decimal "value", precision: 11, scale: 2
    t.bigint "cooperation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cooperation_id"], name: "index_transactions_on_cooperation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "associate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["associate_id"], name: "index_users_on_associate_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cooperations", "associates"
  add_foreign_key "cooperations", "cooperatives"
  add_foreign_key "cooperatives", "segments"
  add_foreign_key "operations", "accounts"
  add_foreign_key "proposals", "assemblies"
  add_foreign_key "transactions", "cooperations"
end
