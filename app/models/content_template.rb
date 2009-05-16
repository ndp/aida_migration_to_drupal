class ContentTemplate < ActiveRecord::Base
  set_table_name 'content_template'


end

#mysql> desc content_template
#    -> ;
#+-------------+--------------+------+-----+---------+----------------+
#| Field       | Type         | Null | Key | Default | Extra          |
#+-------------+--------------+------+-----+---------+----------------+
#| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
#| name        | varchar(20)  | NO   |     |         |                |
#| description | varchar(255) | NO   |     |         |                |
#| file_name   | varchar(255) | NO   |     |         |                |
#| stories     | tinyint(4)   | NO   |     | 0       |                |
#| images      | tinyint(4)   | NO   |     | 0       |                |
#+-------------+--------------+------+-----+---------+----------------+
