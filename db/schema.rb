# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2017_04_28_155425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'app_days', force: :cascade do |t|
    t.bigint 'childern_id'
    t.text 'comment'
    t.string 'thema'
    t.integer 'outdoors'
    t.integer 'sleep'
    t.integer 'food'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['childern_id'], name: 'index_app_days_on_childern_id'
  end

  create_table 'childerns', force: :cascade do |t|
    t.string 'name'
    t.integer 'app_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'food_activities', force: :cascade do |t|
    t.bigint 'childern_id'
    t.bigint 'food_id'
    t.integer 'food_type'
    t.float 'percentage'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['childern_id'], name: 'index_food_activities_on_childern_id'
    t.index ['food_id'], name: 'index_food_activities_on_food_id'
  end

  create_table 'foods', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'images', force: :cascade do |t|
    t.bigint 'childern_id'
    t.text 'comment'
    t.string 'app_id'
    t.string 'image_url'
    t.string 'image_path'
    t.string 'ext'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['childern_id'], name: 'index_images_on_childern_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.integer 'thread_app_id'
    t.integer 'post_app_id'
    t.string 'attachment_url'
    t.text 'info'
    t.string 'sender_name'
    t.integer 'sender_app_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'app_days', 'childerns'
  add_foreign_key 'food_activities', 'childerns'
  add_foreign_key 'food_activities', 'foods'
  add_foreign_key 'images', 'childerns'
end
