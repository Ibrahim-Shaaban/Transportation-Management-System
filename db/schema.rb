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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_170757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.bigint "truck_id", null: false
    t.string "truck_name"
    t.string "truck_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id", "truck_id"], name: "index_assignments_on_driver_id_and_truck_id", unique: true
    t.index ["driver_id"], name: "index_assignments_on_driver_id"
    t.index ["truck_id"], name: "index_assignments_on_truck_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_drivers_on_email", unique: true
  end

  create_table "trucks", force: :cascade do |t|
    t.string "name"
    t.string "truck_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_trucks_on_name", unique: true
  end

  add_foreign_key "assignments", "drivers"
  add_foreign_key "assignments", "trucks"
end
