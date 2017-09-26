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

ActiveRecord::Schema.define(version: 20170908003916) do

  create_table "levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
  end

  create_table "phrases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number", null: false
    t.string "phrase_ja", limit: 128, null: false
    t.string "phrase_en", limit: 128, null: false
    t.string "answer", limit: 32, null: false
    t.string "meanings", limit: 64, null: false
    t.text "explanation"
    t.bigint "section_id"
    t.index ["section_id"], name: "index_phrases_on_section_id"
  end

  create_table "score_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "score_id", null: false
    t.bigint "phrase_id", null: false
    t.boolean "correct", null: false
    t.index ["phrase_id"], name: "index_score_details_on_phrase_id"
    t.index ["score_id"], name: "index_score_details_on_score_id"
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "section_id", null: false
    t.datetime "created_at", null: false
    t.index ["section_id"], name: "index_scores_on_section_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "level_id", null: false
    t.index ["level_id"], name: "index_sections_on_level_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "phrases", "sections"
  add_foreign_key "score_details", "phrases"
  add_foreign_key "score_details", "scores"
  add_foreign_key "scores", "sections"
  add_foreign_key "scores", "users"
  add_foreign_key "sections", "levels"
end
