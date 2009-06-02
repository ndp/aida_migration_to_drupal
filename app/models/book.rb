class Book <  ActiveRecord::Base

  set_table_name 'book'
  set_primary_key 'bid'

  include DrupalBase
end