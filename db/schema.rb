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

ActiveRecord::Schema.define(version: 2022_08_17_183345) do

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "station_index"
    t.datetime "coming_time"
    t.datetime "department_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "user_id"
    t.integer "base_station_id"
    t.integer "end_station_id"
    t.text "lastname"
    t.text "firstname"
    t.integer "passport_id"
    t.index ["base_station_id"], name: "index_tickets_on_base_station_id"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "routes_id"
    t.integer "route_id"
    t.integer "current_station_id"
    t.boolean "vagon_order", default: false
    t.index ["route_id"], name: "index_trains_on_route_id"
    t.index ["routes_id"], name: "index_trains_on_routes_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vagons", force: :cascade do |t|
    t.integer "vagon_id"
    t.integer "order_v"
    t.integer "places_up"
    t.integer "places_down"
    t.integer "side_places_up"
    t.integer "side_places_down"
    t.integer "sitting_places"
    t.string "type"
    t.integer "train_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["train_id"], name: "index_vagons_on_train_id"
  end

end
