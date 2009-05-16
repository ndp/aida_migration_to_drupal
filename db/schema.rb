# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090310044507) do

  create_table "category", :force => true do |t|
    t.string "name_en",  :limit => 100, :default => "", :null => false
    t.string "name_es",  :limit => 100, :default => "", :null => false
    t.string "names_en", :limit => 100, :default => "", :null => false
    t.string "names_es", :limit => 100, :default => "", :null => false
  end

  create_table "content_template", :force => true do |t|
    t.string  "name",        :limit => 20, :default => "", :null => false
    t.string  "description",               :default => "", :null => false
    t.string  "file_name",                 :default => "", :null => false
    t.integer "stories",     :limit => 1,  :default => 0,  :null => false
    t.integer "images",      :limit => 1,  :default => 0,  :null => false
  end

# Could not dump table "document" because of following StandardError
#   Unknown type 'set('en','es')' for column 'langs'

  create_table "image", :primary_key => "image_id", :force => true do |t|
    t.string    "tenant_id",           :limit => 20,         :default => "aida", :null => false
    t.string    "file_name",                                 :default => "",     :null => false
    t.string    "upload_file_name",                          :default => "",     :null => false
    t.integer   "file_size",                                 :default => 0,      :null => false
    t.string    "mime_type",           :limit => 50,         :default => "",     :null => false
    t.integer   "height",                                    :default => 0,      :null => false
    t.integer   "width",                                     :default => 0,      :null => false
    t.binary    "encoded_bytes",       :limit => 2147483647
    t.string    "thumb_file_name"
    t.string    "thumb_mime_type",     :limit => 64
    t.integer   "thumb_width",         :limit => 2
    t.integer   "thumb_height",        :limit => 2
    t.binary    "thumb_encoded_bytes"
    t.timestamp "timestamp",                                                     :null => false
    t.text      "caption_en",                                                    :null => false
    t.text      "caption_es",                                                    :null => false
    t.string    "credit",              :limit => 100
  end

  add_index "image", ["image_id"], :name => "image_id", :unique => true
  add_index "image", ["tenant_id"], :name => "tenant_id"
  add_index "image", ["tenant_id"], :name => "tenant_id_2"

  create_table "image_caption", :id => false, :force => true do |t|
    t.integer "image_id",                :default => 0,    :null => false
    t.string  "lang",     :limit => 2,   :default => "en", :null => false
    t.text    "caption",                                   :null => false
    t.string  "credit",   :limit => 200, :default => "",   :null => false
  end

  add_index "image_caption", ["image_id"], :name => "image_id"

  create_table "language", :primary_key => "lang", :force => true do |t|
    t.string "name",     :limit => 100, :default => "English", :null => false
    t.string "encoding", :limit => 30,  :default => "UTF-8",   :null => false
  end

  add_index "language", ["lang"], :name => "lang", :unique => true

  create_table "mime_types", :primary_key => "mime_types", :force => true do |t|
    t.string  "description", :default => "", :null => false
    t.integer "image_id"
  end

# Could not dump table "org" because of following StandardError
#   Unknown type 'set('en','es','pt','de','it','fr')' for column 'langs'

  create_table "org_category", :id => false, :force => true do |t|
    t.string  "org_id",      :limit => 32, :default => "", :null => false
    t.integer "category_id",               :default => 0,  :null => false
  end

  add_index "org_category", ["category_id"], :name => "category_id"
  add_index "org_category", ["org_id"], :name => "org_id"

  create_table "page", :force => true do |t|
    t.string    "name",             :limit => 40,  :default => "",     :null => false
    t.string    "title_en",         :limit => 100, :default => "",     :null => false
    t.string    "title_es",         :limit => 100, :default => "",     :null => false
    t.string    "active",           :limit => 0,   :default => "N",    :null => false
    t.integer   "story_id1",                       :default => 0,      :null => false
    t.integer   "story_id2",                       :default => 0,      :null => false
    t.integer   "story_id3",                       :default => 0,      :null => false
    t.integer   "story_id4",                       :default => 0,      :null => false
    t.integer   "story_id5",                       :default => 0,      :null => false
    t.integer   "story_id6",                       :default => 0,      :null => false
    t.integer   "story_id7",                       :default => 0,      :null => false
    t.integer   "story_id8",                       :default => 0,      :null => false
    t.integer   "story_id9",                       :default => 0,      :null => false
    t.integer   "story_id10",                      :default => 0,      :null => false
    t.integer   "story_id11",                      :default => 0,      :null => false
    t.string    "org_id",           :limit => 32,  :default => "aida", :null => false
    t.integer   "parent_page_id",                  :default => 0,      :null => false
    t.integer   "content_template",                :default => 0,      :null => false
    t.integer   "image_id1"
    t.integer   "image_id2",                       :default => 0,      :null => false
    t.integer   "image_id3",                       :default => 0,      :null => false
    t.integer   "image_id4",                       :default => 0,      :null => false
    t.integer   "image_id5",                       :default => 0,      :null => false
    t.integer   "image_id6",                       :default => 0,      :null => false
    t.integer   "image_id7",                       :default => 0,      :null => false
    t.integer   "image_id8",                       :default => 0,      :null => false
    t.integer   "image_id9",                       :default => 0,      :null => false
    t.integer   "image_id10",                      :default => 0,      :null => false
    t.integer   "image_id11",                      :default => 0,      :null => false
    t.timestamp "last_changed",                                        :null => false
  end

  add_index "page", ["name"], :name => "name_2", :unique => true
  add_index "page", ["org_id"], :name => "org_id"
  add_index "page", ["parent_page_id"], :name => "parent_page_id"

  create_table "pages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "people" because of following StandardError
#   Unknown type 'set('author','photographer','partner','translator','editor')' for column 'roles'

  create_table "people_org", :id => false, :force => true do |t|
    t.string "user_id", :limit => 20, :default => "", :null => false
    t.string "org_id",  :limit => 32, :default => "", :null => false
  end

  add_index "people_org", ["org_id"], :name => "org_id"
  add_index "people_org", ["user_id"], :name => "user_id"

  create_table "stories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story", :force => true do |t|
    t.string   "org_id",      :limit => 20, :default => "aida", :null => false
    t.integer  "category_id",               :default => 0,      :null => false
    t.string   "author_id",   :limit => 30, :default => "anna", :null => false
    t.datetime "date"
    t.string   "format",      :limit => 0,  :default => "html", :null => false
  end

  add_index "story", ["category_id"], :name => "cat_id"
  add_index "story", ["org_id"], :name => "org_id"

  create_table "story_text", :id => false, :force => true do |t|
    t.integer   "story_id",               :default => 0,      :null => false
    t.string    "lang",     :limit => 2,  :default => "en",   :null => false
    t.string    "title",                  :default => "",     :null => false
    t.text      "text",                                       :null => false
    t.string    "format",   :limit => 0,  :default => "html", :null => false
    t.string    "encoding", :limit => 30
    t.timestamp "date",                                       :null => false
  end

  add_index "story_text", ["lang"], :name => "lang"
  add_index "story_text", ["story_id"], :name => "story_id"

  create_table "story_texts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
