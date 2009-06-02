class NodeRevision < ActiveRecord::Base
  include DrupalBase

  set_primary_key 'vid'

  belongs_to :node, :foreign_key => :nid

end

#| nid       | int(10) unsigned | NO   | MUL | 0       |                |
#| vid       | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
#| uid       | int(11)          | NO   | MUL | 0       |                |
#| title     | varchar(255)     | NO   |     |         |                |
#| body      | longtext         | NO   |     | NULL    |                |
#| teaser    | longtext         | NO   |     | NULL    |                |
#| log       | longtext         | NO   |     | NULL    |                |
#| timestamp | int(11)          | NO   |     | 0       |                |
#| format    | int(11)          | NO   |     | 0       |                |
