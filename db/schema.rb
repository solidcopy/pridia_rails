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

ActiveRecord::Schema[8.1].define(version: 2026_05_06_010552) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "trade_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", limit: 100, null: false, comment: "名前"
    t.bigint "parent_id", comment: "親"
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_trade_categories_on_parent_id"
  end

  create_table "trade_category_inheritances", force: :cascade do |t|
    t.bigint "child_id", null: false
    t.datetime "created_at", null: false
    t.bigint "parent_id", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_trade_category_inheritances_on_child_id"
    t.index ["parent_id", "child_id"], name: "index_trade_category_inheritances_on_parent_id_and_child_id", unique: true
    t.index ["parent_id"], name: "index_trade_category_inheritances_on_parent_id"
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date", null: false, comment: "日付"
    t.string "item", limit: 1000, null: false, comment: "品目"
    t.integer "price", null: false, comment: "金額"
    t.integer "quantity", limit: 2, default: 1, null: false, comment: "数量"
    t.string "remarks", limit: 1000, comment: "備考"
    t.bigint "trade_category_id"
    t.datetime "updated_at", null: false
    t.index ["trade_category_id"], name: "index_trades_on_trade_category_id"
  end

  add_foreign_key "trade_categories", "trade_categories", column: "parent_id"
  add_foreign_key "trade_category_inheritances", "trade_categories", column: "child_id"
  add_foreign_key "trade_category_inheritances", "trade_categories", column: "parent_id"
  add_foreign_key "trades", "trade_categories"
end
