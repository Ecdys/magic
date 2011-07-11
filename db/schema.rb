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

ActiveRecord::Schema.define(:version => 20110711204302) do

  create_table "cabinets", :force => true do |t|
    t.string   "name"
    t.string   "statut"
    t.date     "creation_date"
    t.string   "siret"
    t.text     "description",       :limit => 255
    t.integer  "rating"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "cabinet_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "phone"
    t.string   "mobile_phone"
    t.string   "fonction"
    t.string   "email"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "viadeo"
    t.integer  "cabinet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "implantations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "site"
    t.integer  "cabinet_id"
  end

end
