# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_10_103610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anime_characters", force: :cascade do |t|
    t.bigint "anime_id"
    t.bigint "character_id"
    t.index ["anime_id", "character_id"], name: "index_anime_characters_on_anime_id_and_character_id"
    t.index ["anime_id"], name: "index_anime_characters_on_anime_id"
    t.index ["character_id"], name: "index_anime_characters_on_character_id"
  end

  create_table "anime_genres", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "anime_id"
    t.index ["anime_id", "genre_id"], name: "index_anime_genres_on_anime_id_and_genre_id", unique: true
    t.index ["anime_id"], name: "index_anime_genres_on_anime_id"
    t.index ["genre_id"], name: "index_anime_genres_on_genre_id"
  end

  create_table "anime_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "anime_id"
    t.index ["anime_id", "tag_id"], name: "index_anime_tags_on_anime_id_and_tag_id", unique: true
    t.index ["anime_id"], name: "index_anime_tags_on_anime_id"
    t.index ["tag_id"], name: "index_anime_tags_on_tag_id"
  end

  create_table "anime_types", force: :cascade do |t|
    t.bigint "type_id"
    t.bigint "anime_id"
    t.index ["anime_id", "type_id"], name: "index_anime_types_on_anime_id_and_type_id", unique: true
    t.index ["anime_id"], name: "index_anime_types_on_anime_id"
    t.index ["type_id"], name: "index_anime_types_on_type_id"
  end

  create_table "animes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "episodes"
    t.integer "duration"
    t.integer "score"
    t.float "popularity"
    t.float "rating"
    t.integer "yrating"
    t.bigint "studio_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_animes_on_studio_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.string "japanese"
    t.string "full_name"
    t.text "description"
    t.integer "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "date"
    t.bigint "anime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_comments_on_anime_id"
  end

  create_table "forum_tags", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
  end

  create_table "forums", force: :cascade do |t|
    t.string "title", null: false
    t.integer "position"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "persons", force: :cascade do |t|
    t.string "name", null: false
    t.string "japanese"
    t.string "website"
    t.date "birthday"
    t.integer "spec"
    t.bigint "studio_id"
    t.index ["studio_id"], name: "index_persons_on_studio_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.text "opinion"
    t.bigint "anime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_reviews_on_anime_id"
  end

  create_table "studio_animes", force: :cascade do |t|
    t.bigint "studio_id"
    t.bigint "anime_id"
    t.index ["anime_id"], name: "index_studio_animes_on_anime_id"
    t.index ["studio_id", "anime_id"], name: "index_studio_animes_on_studio_id_and_anime_id", unique: true
    t.index ["studio_id"], name: "index_studio_animes_on_studio_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name", null: false
    t.string "short_name"
    t.string "japanese"
    t.string "website"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "topic_comment", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "date"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_topic_comment_on_topic_id"
  end

  create_table "topic_tags", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "forum_tags_id"
    t.index ["forum_tags_id"], name: "index_topic_tags_on_forum_tags_id"
    t.index ["topic_id", "forum_tags_id"], name: "index_topic_tags_on_topic_id_and_forum_tags_id", unique: true
    t.index ["topic_id"], name: "index_topic_tags_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id"
    t.bigint "forum_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_topics_on_forum_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.index ["name"], name: "index_types_on_name", unique: true
  end

  create_table "user_rates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "anime_id"
    t.float "score", null: false
    t.integer "episodes"
    t.integer "volumes"
    t.integer "chapters"
    t.text "comment"
    t.integer "revision"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_user_rates_on_anime_id"
    t.index ["user_id"], name: "index_user_rates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "location"
    t.text "about"
    t.string "sex"
    t.string "website"
    t.date "birthday"
    t.datetime "last_activity"
    t.string "email", null: false
    t.string "password"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "anime_characters", "animes"
  add_foreign_key "anime_characters", "characters"
  add_foreign_key "anime_genres", "animes"
  add_foreign_key "anime_genres", "genres"
  add_foreign_key "anime_tags", "animes"
  add_foreign_key "anime_tags", "tags"
  add_foreign_key "anime_types", "animes"
  add_foreign_key "anime_types", "types"
  add_foreign_key "animes", "studios"
  add_foreign_key "comments", "animes"
  add_foreign_key "persons", "studios"
  add_foreign_key "reviews", "animes"
  add_foreign_key "studio_animes", "animes"
  add_foreign_key "studio_animes", "studios"
  add_foreign_key "topic_comment", "topics"
  add_foreign_key "topic_tags", "forum_tags", column: "forum_tags_id"
  add_foreign_key "topic_tags", "topics"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "users"
  add_foreign_key "user_rates", "animes"
  add_foreign_key "user_rates", "users"
end
