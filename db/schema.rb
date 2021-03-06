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

ActiveRecord::Schema.define(version: 20160406171655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "landmark"
    t.string   "gender"
    t.string   "phone"
    t.string   "state"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_accounts", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_secret"
    t.string   "oauth_token"
    t.datetime "oauth_expires"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "oauth_accounts", ["user_id"], name: "index_oauth_accounts_on_user_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "order_number"
    t.string   "payment_method"
    t.decimal  "total_amount"
    t.integer  "user_id"
    t.integer  "address_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "notification_params"
    t.string   "status",              default: "Pending"
    t.string   "transaction_id"
    t.datetime "purchased_at"
  end

  add_index "orders", ["address_id"], name: "index_orders_on_address_id", using: :btree
  add_index "orders", ["order_number"], name: "index_orders_on_order_number", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_image_links", force: :cascade do |t|
    t.string   "link_name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_image_links", ["product_id"], name: "index_product_image_links_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity"
    t.string   "code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "brand"
    t.string   "size"
    t.integer  "subcategory_id"
    t.integer  "price"
  end

  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "comment"
    t.integer  "rating"
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "specifications", force: :cascade do |t|
    t.string   "key"
    t.text     "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "specifications", ["product_id"], name: "index_specifications_on_product_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "activation_token"
    t.boolean  "active_status",    default: false
    t.string   "reset_code"
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wishlists", ["product_id"], name: "index_wishlists_on_product_id", using: :btree
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id", using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "oauth_accounts", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "product_image_links", "products"
  add_foreign_key "products", "subcategories"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "specifications", "products"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "wishlists", "products"
  add_foreign_key "wishlists", "users"
end
