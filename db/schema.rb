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

ActiveRecord::Schema.define(version: 2023_01_31_220056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planetary_systems", force: :cascade do |t|
    t.string "name"
    t.integer "light_years_from_earth"
    t.bigint "star_age"
    t.boolean "metal_rich_star"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "planet_type"
    t.integer "year_discovered"
    t.boolean "confirmed"
    t.bigint "planetary_system_id"
    t.index ["planetary_system_id"], name: "index_planets_on_planetary_system_id"
  end

  add_foreign_key "planets", "planetary_systems"
end
