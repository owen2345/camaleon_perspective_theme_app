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

ActiveRecord::Schema.define(version: 20160609121449) do

  create_table "cama_comments", force: :cascade do |t|
    t.string   "author"
    t.string   "author_email"
    t.string   "author_url"
    t.string   "author_IP"
    t.text     "content"
    t.string   "approved",       default: "pending"
    t.string   "agent"
    t.string   "typee"
    t.integer  "comment_parent"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "cama_comments", ["approved"], name: "index_cama_comments_on_approved"
  add_index "cama_comments", ["comment_parent"], name: "index_cama_comments_on_comment_parent"
  add_index "cama_comments", ["post_id"], name: "index_cama_comments_on_post_id"
  add_index "cama_comments", ["user_id"], name: "index_cama_comments_on_user_id"

  create_table "cama_custom_fields", force: :cascade do |t|
    t.string  "object_class"
    t.string  "name"
    t.string  "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count",        default: 0
    t.boolean "is_repeat",    default: false
    t.text    "description"
    t.string  "status"
  end

  add_index "cama_custom_fields", ["object_class"], name: "index_cama_custom_fields_on_object_class"
  add_index "cama_custom_fields", ["objectid"], name: "index_cama_custom_fields_on_objectid"
  add_index "cama_custom_fields", ["parent_id"], name: "index_cama_custom_fields_on_parent_id"
  add_index "cama_custom_fields", ["slug"], name: "index_cama_custom_fields_on_slug"

  create_table "cama_custom_fields_relationships", force: :cascade do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string  "object_class"
    t.text    "value",             limit: 1073741823
    t.string  "custom_field_slug"
    t.integer "group_number",                         default: 0
  end

  add_index "cama_custom_fields_relationships", ["custom_field_id"], name: "index_cama_custom_fields_relationships_on_custom_field_id"
  add_index "cama_custom_fields_relationships", ["custom_field_slug"], name: "index_cama_custom_fields_relationships_on_custom_field_slug"
  add_index "cama_custom_fields_relationships", ["object_class"], name: "index_cama_custom_fields_relationships_on_object_class"
  add_index "cama_custom_fields_relationships", ["objectid"], name: "index_cama_custom_fields_relationships_on_objectid"

  create_table "cama_metas", force: :cascade do |t|
    t.string  "key"
    t.text    "value",        limit: 1073741823
    t.integer "objectid"
    t.string  "object_class"
  end

  add_index "cama_metas", ["key"], name: "index_cama_metas_on_key"
  add_index "cama_metas", ["object_class"], name: "index_cama_metas_on_object_class"
  add_index "cama_metas", ["objectid"], name: "index_cama_metas_on_objectid"

  create_table "cama_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content",          limit: 1073741823
    t.text     "content_filtered", limit: 1073741823
    t.string   "status",                              default: "published"
    t.datetime "published_at"
    t.integer  "post_parent"
    t.string   "visibility",                          default: "public"
    t.text     "visibility_value"
    t.string   "post_class",                          default: "Post"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "user_id"
    t.integer  "post_order",                          default: 0
    t.integer  "taxonomy_id"
    t.boolean  "is_feature",                          default: false
  end

  add_index "cama_posts", ["post_class"], name: "index_cama_posts_on_post_class"
  add_index "cama_posts", ["post_parent"], name: "index_cama_posts_on_post_parent"
  add_index "cama_posts", ["slug"], name: "index_cama_posts_on_slug"
  add_index "cama_posts", ["status"], name: "index_cama_posts_on_status"
  add_index "cama_posts", ["user_id"], name: "index_cama_posts_on_user_id"

  create_table "cama_term_relationships", force: :cascade do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
  end

  add_index "cama_term_relationships", ["objectid"], name: "index_cama_term_relationships_on_objectid"
  add_index "cama_term_relationships", ["term_order"], name: "index_cama_term_relationships_on_term_order"
  add_index "cama_term_relationships", ["term_taxonomy_id"], name: "index_cama_term_relationships_on_term_taxonomy_id"

  create_table "cama_term_taxonomy", force: :cascade do |t|
    t.string   "taxonomy"
    t.text     "description", limit: 1073741823
    t.integer  "parent_id"
    t.integer  "count"
    t.string   "name"
    t.string   "slug"
    t.integer  "term_group"
    t.integer  "term_order"
    t.string   "status"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
  end

  add_index "cama_term_taxonomy", ["parent_id"], name: "index_cama_term_taxonomy_on_parent_id"
  add_index "cama_term_taxonomy", ["slug"], name: "index_cama_term_taxonomy_on_slug"
  add_index "cama_term_taxonomy", ["taxonomy"], name: "index_cama_term_taxonomy_on_taxonomy"
  add_index "cama_term_taxonomy", ["term_order"], name: "index_cama_term_taxonomy_on_term_order"
  add_index "cama_term_taxonomy", ["user_id"], name: "index_cama_term_taxonomy_on_user_id"

  create_table "cama_user_relationships", force: :cascade do |t|
    t.integer "term_order"
    t.integer "active",           default: 1
    t.integer "term_taxonomy_id"
    t.integer "user_id"
  end

  add_index "cama_user_relationships", ["term_taxonomy_id"], name: "index_cama_user_relationships_on_term_taxonomy_id"
  add_index "cama_user_relationships", ["user_id"], name: "index_cama_user_relationships_on_user_id"

  create_table "cama_users", force: :cascade do |t|
    t.string   "username"
    t.string   "role",                   default: "client"
    t.string   "email"
    t.string   "slug"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.integer  "parent_id"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "site_id",                default: -1
    t.string   "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean  "is_valid_email",         default: true
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "cama_users", ["email"], name: "index_cama_users_on_email"
  add_index "cama_users", ["role"], name: "index_cama_users_on_role"
  add_index "cama_users", ["site_id"], name: "index_cama_users_on_site_id"
  add_index "cama_users", ["username"], name: "index_cama_users_on_username"

  create_table "plugins_attacks", force: :cascade do |t|
    t.string   "path"
    t.string   "browser_key"
    t.integer  "site_id"
    t.datetime "created_at"
  end

  add_index "plugins_attacks", ["browser_key"], name: "index_plugins_attacks_on_browser_key"
  add_index "plugins_attacks", ["path"], name: "index_plugins_attacks_on_path"
  add_index "plugins_attacks", ["site_id"], name: "index_plugins_attacks_on_site_id"

  create_table "plugins_contact_forms", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "count"
    t.integer  "parent_id"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.text     "value"
    t.text     "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugins_subscriber_group_items", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "item_id"
    t.string   "status",     default: "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins_subscriber_group_items", ["group_id"], name: "index_plugins_subscriber_group_items_on_group_id"
  add_index "plugins_subscriber_group_items", ["item_id"], name: "index_plugins_subscriber_group_items_on_item_id"

  create_table "plugins_subscriber_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.boolean  "send_welcome"
    t.string   "welcome_subject"
    t.text     "welcome_msg"
    t.boolean  "send_left_group"
    t.string   "left_subject"
    t.text     "left_msg"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins_subscriber_groups", ["site_id"], name: "index_plugins_subscriber_groups_on_site_id"

  create_table "plugins_subscriber_items", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "status",          default: "approved"
    t.datetime "unsubscribed_at"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins_subscriber_items", ["site_id"], name: "index_plugins_subscriber_items_on_site_id"

  create_table "plugins_subscriber_promotion_groups", force: :cascade do |t|
    t.integer "promotion_id"
    t.integer "group_id"
  end

  add_index "plugins_subscriber_promotion_groups", ["group_id"], name: "index_plugins_subscriber_promotion_groups_on_group_id"
  add_index "plugins_subscriber_promotion_groups", ["promotion_id"], name: "index_plugins_subscriber_promotion_groups_on_promotion_id"

  create_table "plugins_subscriber_promotion_items", force: :cascade do |t|
    t.integer  "promotion_id"
    t.integer  "item_id"
    t.integer  "qty_opened",   default: 0
    t.string   "status",       default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins_subscriber_promotion_items", ["item_id"], name: "index_plugins_subscriber_promotion_items_on_item_id"
  add_index "plugins_subscriber_promotion_items", ["promotion_id"], name: "index_plugins_subscriber_promotion_items_on_promotion_id"

  create_table "plugins_subscriber_promotions", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.string   "layout"
    t.string   "template"
    t.string   "email_from"
    t.string   "email_cc"
    t.string   "subject"
    t.text     "content"
    t.string   "status",     default: "pending"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugins_subscriber_promotions", ["site_id"], name: "index_plugins_subscriber_promotions_on_site_id"

end
