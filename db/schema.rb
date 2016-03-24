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

ActiveRecord::Schema.define(version: 0) do

  create_table "authors", force: :cascade do |t|
    t.text "name",              null: false
    t.text "sort"
    t.text "link", default: "", null: false
  end

  add_index "authors", ["name"], name: "sqlite_autoindex_authors_1", unique: true
  
  create_table "books", force: :cascade do |t|
    t.text "title", null: false
    t.text "sort"
    t.datetime "timestamp"
    t.datetime "pubdate"
    t.float "series_index"
    t.text "author_sort"
    t.text "isbn"
    t.text "lccn"
    t.text "path", null: false
    t.integer "flags", null: false
    t.text "uuid"
    t.boolean "has_cover"
    t.datetime "last_modified"
  end 

  create_table "books_authors_link", force: :cascade do |t|
    t.integer "book",   null: false
    t.integer "author", null: false
  end

  add_index "books_authors_link", ["author"], name: "books_authors_link_aidx"
  add_index "books_authors_link", ["book", "author"], name: "sqlite_autoindex_books_authors_link_1", unique: true
  add_index "books_authors_link", ["book"], name: "books_authors_link_bidx"

  create_table "books_languages_link", force: :cascade do |t|
    t.integer "book",                   null: false
    t.integer "lang_code",              null: false
    t.integer "item_order", default: 0, null: false
  end

  add_index "books_languages_link", ["book", "lang_code"], name: "sqlite_autoindex_books_languages_link_1", unique: true
  add_index "books_languages_link", ["book"], name: "books_languages_link_bidx"
  add_index "books_languages_link", ["lang_code"], name: "books_languages_link_aidx"

  create_table "books_plugin_data", force: :cascade do |t|
    t.integer "book"
    t.text    "name"
    t.text    "val"
  end

  add_index "books_plugin_data", ["book", "name"], name: "sqlite_autoindex_books_plugin_data_1", unique: true

  create_table "books_publishers_link", force: :cascade do |t|
    t.integer "book",      null: false
    t.integer "publisher", null: false
  end

  add_index "books_publishers_link", ["book"], name: "books_publishers_link_bidx"
  add_index "books_publishers_link", ["book"], name: "sqlite_autoindex_books_publishers_link_1", unique: true
  add_index "books_publishers_link", ["publisher"], name: "books_publishers_link_aidx"

  create_table "books_ratings_link", force: :cascade do |t|
    t.integer "book",   null: false
    t.integer "rating", null: false
  end

  add_index "books_ratings_link", ["book", "rating"], name: "sqlite_autoindex_books_ratings_link_1", unique: true
  add_index "books_ratings_link", ["book"], name: "books_ratings_link_bidx"
  add_index "books_ratings_link", ["rating"], name: "books_ratings_link_aidx"

  create_table "books_series_link", force: :cascade do |t|
    t.integer "book",   null: false
    t.integer "series", null: false
  end

  add_index "books_series_link", ["book"], name: "books_series_link_bidx"
  add_index "books_series_link", ["book"], name: "sqlite_autoindex_books_series_link_1", unique: true
  add_index "books_series_link", ["series"], name: "books_series_link_aidx"

  create_table "books_tags_link", force: :cascade do |t|
    t.integer "book", null: false
    t.integer "tag",  null: false
  end

  add_index "books_tags_link", ["book", "tag"], name: "sqlite_autoindex_books_tags_link_1", unique: true
  add_index "books_tags_link", ["book"], name: "books_tags_link_bidx"
  add_index "books_tags_link", ["tag"], name: "books_tags_link_aidx"

  create_table "comments", force: :cascade do |t|
    t.integer "book"
    t.text    "text"
  end

  add_index "comments", ["book"], name: "comments_idx"
  add_index "comments", ["book"], name: "sqlite_autoindex_comments_1", unique: true

  create_table "conversion_options", force: :cascade do |t|
    t.text    "format", null: false
    t.integer "book"
    t.binary  "data",   null: false
  end

  add_index "conversion_options", ["book"], name: "conversion_options_idx_b"
  add_index "conversion_options", ["format", "book"], name: "sqlite_autoindex_conversion_options_1", unique: true
  add_index "conversion_options", ["format"], name: "conversion_options_idx_a"

  create_table "data", force: :cascade do |t|
    t.integer "book"
    t.text    "format"
    t.integer "uncompressed_size"
    t.text    "name"
  end

  add_index "data", ["book", "format"], name: "sqlite_autoindex_data_1", unique: true
  add_index "data", ["book"], name: "data_idx"
  add_index "data", ["format"], name: "formats_idx"

  create_table "feeds", force: :cascade do |t|
    t.text "title",  null: false
    t.text "script", null: false
  end

  add_index "feeds", ["title"], name: "sqlite_autoindex_feeds_1", unique: true

  create_table "identifiers", force: :cascade do |t|
    t.integer "book"
    t.text    "type", default: "isbn"
    t.text    "val"
  end

  add_index "identifiers", ["book", "type"], name: "sqlite_autoindex_identifiers_1", unique: true

  create_table "languages", force: :cascade do |t|
    t.text "lang_code"
  end

  add_index "languages", ["lang_code"], name: "languages_idx"
  add_index "languages", ["lang_code"], name: "sqlite_autoindex_languages_1", unique: true

  create_table "library_id", force: :cascade do |t|
    t.text "uuid", null: false
  end

  add_index "library_id", ["uuid"], name: "sqlite_autoindex_library_id_1", unique: true

  create_table "metadata_dirtied", force: :cascade do |t|
    t.integer "book", null: false
  end

  add_index "metadata_dirtied", ["book"], name: "sqlite_autoindex_metadata_dirtied_1", unique: true

  create_table "preferences", force: :cascade do |t|
    t.text "key"
    t.text "val"
  end

  add_index "preferences", ["key"], name: "sqlite_autoindex_preferences_1", unique: true

  create_table "publishers", force: :cascade do |t|
    t.text "name", null: false
    t.text "sort"
  end

  add_index "publishers", ["name"], name: "publishers_idx"
  add_index "publishers", ["name"], name: "sqlite_autoindex_publishers_1", unique: true

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
  end

  add_index "ratings", ["rating"], name: "sqlite_autoindex_ratings_1", unique: true

  create_table "series", force: :cascade do |t|
    t.text "name", null: false
    t.text "sort"
  end

  add_index "series", ["name"], name: "series_idx"
  add_index "series", ["name"], name: "sqlite_autoindex_series_1", unique: true

  create_table "tags", force: :cascade do |t|
    t.text "name", null: false
  end

  add_index "tags", ["name"], name: "sqlite_autoindex_tags_1", unique: true
  add_index "tags", ["name"], name: "tags_idx"

end
