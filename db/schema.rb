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

ActiveRecord::Schema.define(:version => 20131013235409) do

  create_table "customers", :force => true do |t|
    t.string   "app_name"
    t.string   "app_id"
    t.string   "secret"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "valid_customer",   :default => true
    t.text     "display_settings"
    t.text     "other_settings"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "customers", ["email", "secret"], :name => "index_customers_on_email_and_secret"

  create_table "sessions", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.string   "start_time"
    t.string   "end_time"
    t.text     "invited_contacts"
    t.string   "invitation_url"
    t.integer  "unique_invitation_clicks"
    t.integer  "num_invitations"
    t.string   "session_type"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "trackings", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "session_id"
    t.string   "page_key"
    t.string   "type"
    t.string   "client_timestamp"
    t.string   "tracking_code"
    t.text     "tracking_info"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "customer_id"
    t.string   "device_id"
    t.string   "device_type"
    t.string   "device_os"
    t.string   "device_carrier"
    t.string   "sdk_version"
    t.string   "device_locale"
    t.text     "contact_info"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
