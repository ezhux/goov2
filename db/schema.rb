# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100520202504) do

  create_table "activities", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "study_program_id"
    t.integer  "exchange_program_id"
    t.integer  "activity_area_id"
    t.date     "from"
    t.date     "to"
    t.boolean  "current"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concepts", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "added_by"
    t.integer  "subject_area_id"
    t.integer  "country_id"
    t.boolean  "goout_intern"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "blog_url"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "name"
    t.string   "surname"
    t.integer  "current_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
