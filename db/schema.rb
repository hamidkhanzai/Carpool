# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130702125216) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "license"
    t.boolean  "privateCar"
    t.boolean  "checked"
    t.boolean  "policy"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cars", :force => true do |t|
    t.integer  "user_id"
    t.string   "number_plate"
    t.integer  "model"
    t.string   "company"
    t.integer  "no_passengers"
    t.string   "others"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "driver_name"
    t.string   "driver_lastname"
    t.integer  "car_number_plate"
    t.string   "travel_from"
    t.string   "travel_to"
    t.date     "travel_date"
    t.string   "travel_time"
    t.text     "report_body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "routs", :force => true do |t|
    t.string   "d_from"
    t.string   "d_to"
    t.integer  "user_id"
    t.integer  "car_id"
    t.text     "description"
    t.integer  "free_seats"
    t.string   "price"
    t.date     "travel_date"
    t.string   "travel_t"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "routs", ["user_id"], :name => "index_routs_on_userId"

  create_table "users", :force => true do |t|
    t.string   "first_name",             :limit => 40
    t.string   "last_name",              :limit => 40
    t.string   "username",               :limit => 30
    t.string   "email",                  :limit => 50
    t.string   "phone",                  :limit => 15
    t.integer  "nid_no"
    t.integer  "licence_no"
    t.string   "salt",                   :limit => 100
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "encrypted_password",                    :default => "",    :null => false
    t.boolean  "Admin",                                 :default => false, :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid"
    t.string   "provider"
    t.boolean  "isDriver"
    t.string   "imgPath"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

end
