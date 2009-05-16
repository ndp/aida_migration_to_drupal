#+-------------+---------------------+------+-----+---------+----------------+
#| Field       | Type                | Null | Key | Default | Extra          |
#+-------------+---------------------+------+-----+---------+----------------+
#| id          | int(11)             | NO   | PRI | NULL    | auto_increment |
#| org_id      | varchar(20)         | NO   | MUL | aida    |                |
#| category_id | int(11)             | NO   | MUL | 0       |                |
#| author_id   | varchar(30)         | NO   |     | anna    |                |
#| date        | datetime            | YES  |     | NULL    |                |
#| format      | enum('html','text') | NO   |     | html    |                |

class Story < ActiveRecord::Base
  set_table_name 'story'

  has_many :story_texts

  def self.relink(s)
    s.gsub(/\{PAGE [^}]*\}/) do |s|
      s.gsub! '{PAGE ', ''
      s.gsub! '}', ''
      n,label = s.split(' ', 2)
      "<a href=\"/?q=#{n}\">#{label}</a>"
    end
  end

end
