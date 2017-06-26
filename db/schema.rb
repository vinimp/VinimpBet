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

ActiveRecord::Schema.define(version: 201703062413017) do

  create_table "bet_puntates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bet_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "evento_scommesso"
    t.boolean  "chiusura",         default: false
    t.integer  "n_giornata"
  end

  create_table "bets", force: :cascade do |t|
    t.string   "evento"
    t.decimal  "vittoria"
    t.decimal  "pareggio"
    t.decimal  "sconfitta"
    t.date     "data"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.string   "logo_in_file_name"
    t.string   "logo_in_content_type"
    t.integer  "logo_in_file_size"
    t.datetime "logo_in_updated_at"
    t.string   "logo_out_file_name"
    t.string   "logo_out_content_type"
    t.integer  "logo_out_file_size"
    t.datetime "logo_out_updated_at"
    t.integer  "n_giornata"
    t.string   "risultato"
    t.boolean  "chiudi_concorso",       default: false
  end

  create_table "classificas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "n_giornata"
    t.decimal  "punteggio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eurekas", force: :cascade do |t|
    t.string   "evento1"
    t.string   "evento2"
    t.decimal  "unouno"
    t.decimal  "unox"
    t.decimal  "x"
    t.decimal  "due"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "puntata11"
    t.decimal  "puntata1x"
    t.decimal  "puntatax"
    t.decimal  "puntata2"
    t.decimal  "spesa"
    t.decimal  "vincita_lorda"
    t.decimal  "spesa_totale"
    t.decimal  "vincita_totale"
    t.date     "data"
    t.decimal  "vincita"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "autorizzo",              default: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end