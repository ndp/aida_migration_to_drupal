class StoryText < ActiveRecord::Base
  set_table_name 'story_text'

  belongs_to :story

  named_scope :english, :conditions=>{:lang=>'en'}
  named_scope :spanish, :conditions=>{:lang=>'es'}

#  +----------+---------------------+------+-----+-------------------+-------+
#  | Field    | Type                | Null | Key | Default           | Extra |
#  +----------+---------------------+------+-----+-------------------+-------+
#  | story_id | int(11)             | NO   | PRI | 0                 |       |
#  | lang     | char(2)             | NO   | PRI | en                |       |
#  | title    | varchar(255)        | NO   |     |                   |       |
#  | text     | text                | NO   |     |                   |       |
#  | format   | enum('text','html') | NO   |     | html              |       |
#  | encoding | varchar(30)         | YES  |     | NULL              |       |
#  | date     | timestamp           | NO   |     | CURRENT_TIMESTAMP |       |
#  +----------+---------------------+------+-----+-------------------+-------+

end
