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

ActiveRecord::Schema.define(version: 20150815021925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text   "content"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "inviter_id"
    t.string   "recipient_name",  limit: 255
    t.string   "recipient_email", limit: 255
    t.text     "message"
    t.string   "token",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.string   "reference_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queue_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "leader_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.integer  "rating"
    t.text     "context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "full_name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token",           limit: 255
    t.boolean  "admin"
    t.string   "customer_token",  limit: 255
    t.boolean  "active",                      default: true
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "large_cover", limit: 255
    t.string   "small_cover", limit: 255
    t.string   "video_url",   limit: 255
  end

end
