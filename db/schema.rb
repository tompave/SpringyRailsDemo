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

ActiveRecord::Schema.define(:version => 20121121100813) do

  create_table "friendships", :id => false, :force => true do |t|
    t.integer "self_id"
    t.integer "friend_id"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["self_id", "friend_id"], :name => "index_friendships_on_self_id_and_friend_id", :unique => true
  add_index "friendships", ["self_id"], :name => "index_friendships_on_self_id"

  create_table "parties", :force => true do |t|
    t.string   "theme"
    t.string   "venue"
    t.integer  "organizer_id"
    t.integer  "participations_count"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "party_participations", :force => true do |t|
    t.boolean  "confirmed",         :default => false
    t.integer  "attendee_id"
    t.integer  "attended_party_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.integer  "parties_count"
    t.integer  "participations_count"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "people", ["name"], :name => "index_people_on_name"

end
