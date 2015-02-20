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


class CreateDatabase < ActiveRecord::Migration
  def self.up
    ActiveRecord::Schema.define(version: 0) do

	  create_table "questions", primary_key: "question_id", force: :cascade do |t|
		t.string  "question", limit: 50, null: false
		t.string  "ans1",     limit: 50, null: false
		t.string  "ans2",     limit: 50, null: false
		t.string  "ans3",     limit: 50
		t.string  "ans4",     limit: 50
		t.string  "ans5",     limit: 50
		t.string  "ans6",     limit: 50
		t.integer "correct",  limit: 4,  null: false
		t.integer "quiz_id",  limit: 4,  null: false
	  end

	  add_index "questions", ["quiz_id"], name: "quiz_id", using: :btree
	  
		create_table "scores", primary_key: "score_id", force: :cascade do |t|
		t.integer "score",   limit: 4, null: false
		t.integer "quiz_id", limit: 4, null: false
	  end

	  add_index "scores", ["quiz_id"], name: "quiz_id", using: :btree

	  create_table "quizzes", primary_key: "quiz_id", force: :cascade do |t|
		t.string "name", limit: 50, null: false
	  end

	  add_foreign_key "scores", "quizzes", primary_key: "quiz_id", name: "scores_ibfk_1"
	end
  end
 
  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end
