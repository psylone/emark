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

ActiveRecord::Schema.define(version: 20141110123940) do

  create_table "grades", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marks", force: true do |t|
    t.integer  "value"
    t.integer  "subject_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marks", ["subject_line_id"], name: "index_marks_on_subject_line_id"

  create_table "subject_lines", force: true do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_lines", ["subject_id", "user_id"], name: "index_subject_lines_on_subject_id_and_user_id"

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["grade_id"], name: "index_subjects_on_grade_id"
  add_index "subjects", ["user_id"], name: "index_subjects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "fio"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.boolean  "is_teacher",      default: false
    t.integer  "grade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
