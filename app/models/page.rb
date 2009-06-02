class Page < ActiveRecord::Base
  set_table_name 'page'

  belongs_to :content_template, :foreign_key=>:content_template

  belongs_to :story, :foreign_key=>:story_id1
#  [1..11].each do |i|
#    has_one "story#{i}".to_sym, :class_name=>'Story', :foreign_key=>"story#{i}"
#  end
#  [1..11].each do |i|
#    has_one "image#{i}".to_sym, :class_name=>'Image', :foreign_key=>"image#{i}"
#  end
  has_one :parent, :foreign_key=>'parent_page_id', :class_name=>'Page'
  has_many :children, :foreign_key=>'parent_page_id', :class_name=>'Page'

  def node_id_en
    en_id = self.id
  end

  def node_id_es
    self.id + 1000;
  end

  def node_id(lang)
    self.send("node_id_#{lang}".to_sym)
  end


  def title(lang)
    self.send("title_#{lang}".to_sym)
  end


  def story_count
    content_template ? content_template.stories : 0
  end

  def image_count
    content_template ? content_template.images : 0
  end

  def text_en
    return '' unless story_count && story && story.story_texts.count
    Story.relink story.story_texts.english[0].text
  end

  def text_es
    return '' unless story_count && story && story.story_texts.count
    Story.relink story.story_texts.spanish[0].text
  end

  def text(lang)
    self.send("text_#{lang}".to_sym)
  end

  def depth
    parent ? (1 + parent.depth) : 1
  end

  def hier
    parent ? (parent.hier << self).flatten : [self]
  end

  #
  #  name   	varchar(40)  	latin1_swedish_ci  	   	S’   	   	   	  Cambiar   	  Eliminar   	  Primaria   	  êndice   	  ònico   	  Texto completo
  #	 title_en  	varchar(100) 	latin1_swedish_ci 	  	S’  	  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 title_es  	varchar(100) 	latin1_swedish_ci 	  	S’  	  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 active  	enum('Y', 'N') 	latin1_swedish_ci 	  	S’  	N  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id1  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id2  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id3  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id4  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id5  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id6  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id7  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id8  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id9  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id10  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 story_id11  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 org_id  	varchar(32) 	latin1_swedish_ci 	  	S’  	aida  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 parent_page_id  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 content_template  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id1  	int(11) 	  	  	S’  	NULL  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id2  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id3  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id4  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id5  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id6  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id7  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id8  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id9  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id10  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 image_id11  	int(11) 	  	  	S’  	0  	  	Cambiar 	Eliminar 	Primaria 	êndice 	ònico 	Texto completo
  #	 last_changed
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
