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

ActiveRecord::Schema.define(version: 20150302073611) do

  create_table "answers", primary_key: "answer_id", force: :cascade do |t|
    t.integer "question_id", limit: 4
    t.string  "value",       limit: 255
    t.boolean "is_correct",  limit: 1
    t.boolean "anchored",    limit: 1
  end

  add_index "answers", ["question_id"], name: "question_id", using: :btree

  create_table "questions", primary_key: "question_id", force: :cascade do |t|
    t.string  "question", limit: 50, null: false
    t.integer "quiz_id",  limit: 4,  null: false
  end

  add_index "questions", ["quiz_id"], name: "quiz_id", using: :btree

  create_table "quizzes", primary_key: "quiz_id", force: :cascade do |t|
    t.string  "name",     limit: 50, null: false
    t.integer "user_id",  limit: 4
    t.boolean "shuffled", limit: 1
  end

  create_table "scores", primary_key: "score_id", force: :cascade do |t|
    t.integer  "score",   limit: 4, null: false
    t.integer  "quiz_id", limit: 4, null: false
    t.integer  "user_id", limit: 4
    t.datetime "date"
  end

  add_index "scores", ["quiz_id"], name: "quiz_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "questions", "quizzes", primary_key: "quiz_id", name: "questions_ibfk_1"
  add_foreign_key "scores", "quizzes", primary_key: "quiz_id", name: "scores_ibfk_1"
end
