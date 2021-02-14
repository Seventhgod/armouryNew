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

ActiveRecord::Schema.define(version: 2021_02_13_173136) do

  create_table "arm_returns", charset: "utf8mb4", force: :cascade do |t|
    t.string "personnel"
    t.string "arm"
    t.string "srl_num"
    t.string "return_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "armrequests", charset: "utf8mb4", force: :cascade do |t|
    t.string "personnel"
    t.string "arm_type"
    t.string "arm"
    t.integer "quantity"
    t.string "user"
    t.string "return_status"
    t.date "request_date"
    t.date "return_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "srl_num"
  end

  create_table "arms", charset: "utf8mb4", force: :cascade do |t|
    t.string "srl_num"
    t.string "arm_name"
    t.string "arm_type"
    t.integer "quantity"
    t.string "servicability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "officers", charset: "utf8mb4", force: :cascade do |t|
    t.string "svc_number"
    t.string "rank"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.date "commission_date"
    t.date "seniority_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "soldiers", charset: "utf8mb4", force: :cascade do |t|
    t.string "svc_number"
    t.string "rank"
    t.string "name"
    t.string "gender"
    t.date "dob"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
