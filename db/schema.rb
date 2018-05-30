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

ActiveRecord::Schema.define(version: 20180530130142) do

  create_table "article_categories", force: :cascade do |t|
    t.string "name"
    t.integer "sort", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sort"], name: "index_article_categories_on_sort"
  end

  create_table "article_relationships", force: :cascade do |t|
    t.integer "article_id"
    t.integer "article_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "article_category_id"
    t.integer "user_id"
    t.string "status", default: "draft"
    t.string "image"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "source"
    t.string "category", default: "糖果空投"
    t.index ["article_category_id"], name: "index_articles_on_article_category_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "ico_start"
    t.string "ico_end"
    t.string "ico_url"
    t.string "website"
    t.string "slack"
    t.string "facebook"
    t.string "telegram"
    t.string "twitter"
    t.string "weibo"
    t.string "github"
    t.string "whitepaper"
    t.string "ico_amount"
    t.string "token_amount"
    t.string "raised_ceiling"
    t.string "fundraising_cost"
    t.string "accept_token"
    t.string "token_type"
    t.text "introduce"
    t.text "rating_report"
    t.string "grade"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
    t.string "status", default: "draft"
    t.index ["title"], name: "index_projects_on_title"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "site_nodes", force: :cascade do |t|
    t.string "name"
    t.integer "sort", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sort"], name: "index_site_nodes_on_sort"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "description"
    t.integer "site_node_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_node_id"], name: "index_sites_on_site_node_id"
    t.index ["url"], name: "index_sites_on_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "username"
    t.string "role"
    t.string "time_zone"
    t.string "summary"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
