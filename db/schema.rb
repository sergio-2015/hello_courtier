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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160607082515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broker_agencies", force: :cascade do |t|
    t.integer  "broker_id"
    t.string   "business_status",  default: "none"
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "website"
    t.string   "twitter_account"
    t.string   "facebook_account"
    t.string   "linkedin_account"
    t.string   "street"
    t.string   "zipcode"
    t.string   "city"
    t.integer  "creation_year"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "pjid"
    t.string   "siret"
    t.string   "complete_adress"
  end

  add_index "broker_agencies", ["broker_id"], name: "index_broker_agencies_on_broker_id", using: :btree

  create_table "broker_agency_expertises", force: :cascade do |t|
    t.integer  "expertise_id"
    t.integer  "broker_agency_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "broker_agency_expertises", ["broker_agency_id"], name: "index_broker_agency_expertises_on_broker_agency_id", using: :btree
  add_index "broker_agency_expertises", ["expertise_id"], name: "index_broker_agency_expertises_on_expertise_id", using: :btree

  create_table "brokers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "brokers", ["email"], name: "index_brokers_on_email", unique: true, using: :btree
  add_index "brokers", ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true, using: :btree

  create_table "expertises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "broker_agencies", "brokers"
  add_foreign_key "broker_agency_expertises", "broker_agencies"
  add_foreign_key "broker_agency_expertises", "expertises"
end
