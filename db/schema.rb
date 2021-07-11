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

ActiveRecord::Schema.define(version: 2021_07_03_040919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlists", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.integer "default_bpm", default: 150
    t.float "max_playback_rate", default: 1.5
    t.float "min_playback_rate", default: 0.75
    t.string "key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_video_id", null: false
    t.integer "bpm"
    t.bigint "playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_videos_on_playlist_id"
    t.index ["youtube_video_id", "playlist_id"], name: "index_videos_on_youtube_video_id_and_playlist_id", unique: true
  end

  add_foreign_key "videos", "playlists"
end
