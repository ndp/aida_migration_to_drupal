class MenuLink <  ActiveRecord::Base
  set_primary_key 'mlid'

  belongs_to :parent, :foreign_key=>'plid', :class_name=>'MenuLink'
  belongs_to :heir1, :foreign_key=>'p1', :class_name=>'MenuLink'
  belongs_to :heir2, :foreign_key=>'p2', :class_name=>'MenuLink'
  belongs_to :heir3, :foreign_key=>'p3', :class_name=>'MenuLink'
  belongs_to :hier4, :foreign_key=>'p4', :class_name=>'MenuLink'
  belongs_to :hier5, :foreign_key=>'p5', :class_name=>'MenuLink'

  include DrupalBase

  def initialize(parent_menu, node, opts)
    title = node.title
#    options = 'a:2:{s:10:"attributes";a:1:{s:5:"title";s:'+ title.length.to_s+':"'+ title+'";}s:5:"alter";b:1;}'
#    options='a:1:{s:8:"langcode";s:2:"es";}' if node.language=='es'

#|| a:3:{s:10:"attributes";a:1:{s:5:"title";s:13:"AIDA Finances";}s:5:"alter";b:1;s:8:"langcode";s:2:"en";}       | menu   |      0 |        0 |            0 |        0 |      0 |     1 |          1 | 2520 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       1 |
#|| a:3:{s:10:"attributes";a:1:{s:5:"title";s:19:"Credits Description";}s:5:"alter";b:1;s:8:"langcode";s:2:"es";} | menu   |      0 |        0 |            1 |        0 |      0 |     1 |          1 | 2506 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       1 |
    options = 'a:3:{s:10:"attributes";a:1:{s:5:"title";s:'+ title.length.to_s+':"'+title+'";}s:5:"alter";b:1;s:8:"langcode";s:2:"'+node.language+'";}'

    super(opts.merge(
        :link_path=>node.link_path(true),
            :router_path=>node.router_path,
            :link_title=>title,
            :options=>options,
            :module=>'menu',
            :plid=>(parent_menu ? parent_menu.mlid : 0),
            :depth=>(parent_menu ? parent_menu.depth + 1 : 1),
            :p1 => (parent_menu ? parent_menu.p1 : 0),
            :p2 => (parent_menu ? parent_menu.p2 : 0),
            :p3 => (parent_menu ? parent_menu.p3 : 0),
            :p4 => (parent_menu ? parent_menu.p4 : 0),
            :p5 => (parent_menu ? parent_menu.p5 : 0),
            :p6 => (parent_menu ? parent_menu.p6 : 0),
            :p7 => (parent_menu ? parent_menu.p7 : 0),
            :p8 => (parent_menu ? parent_menu.p8 : 0),
            :p9 => (parent_menu ? parent_menu.p9 : 0), :updated=>1,:expanded=>(parent_menu ? 1 : 0)
    ))
#+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
    #| menu_name       | mlid | plid | link_path | router_path | link_title                     | options                                                                                   | module | hidden | external | has_children | expanded | weight | depth | customized | p1  | p2  | p3 | p4 | p5 | p6 | p7 | p8 | p9 | updated |
    #+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+
    #| secondary-links |  145 |    0 | node/1190 | node/%      | TITLE OF LAOROGYA MENU ENGLISH | a:2:{s:10:"attributes";a:1:{s:5:"title";s:17:"La Oroya Whatever";}s:5:"alter";b:1;}       | menu   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 145 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  146 |    0 | node/190  | node/%      | LA OROYA SUBSCRIBE ENGLISH     | a:2:{s:10:"attributes";a:1:{s:5:"title";s:18:"La Oroya Subscribe";}s:5:"alter";b:1;}      | menu   |      0 |        0 |            1 |        0 |      0 |     1 |          0 | 146 |   0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  147 |  145 | node/1158 | node/%      | Instrumentos Econ?micos        | a:2:{s:10:"attributes";a:1:{s:5:"title";s:24:"Instrumentos Econ?micos";}s:5:"alter";b:1;} | menu   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 145 | 147 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #| secondary-links |  148 |  146 | node/158  | node/%      | Economic Instruments           | a:2:{s:10:"attributes";a:1:{s:5:"title";s:20:"Economic Instruments";}s:5:"alter";b:1;}    | menu   |      0 |        0 |            0 |        0 |      0 |     2 |          0 | 146 | 148 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
    #+-----------------+------+------+-----------+-------------+--------------------------------+-------------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+-----+-----+----+----+----+----+----+----+----+---------+



#| menu_name     | mlid | plid | link_path | router_path | link_title         | options                                                                               | module | hidden | external | has_children | expanded | weight | depth | customized | p1   | p2 | p3 | p4 | p5 | p6 | p7 | p8 | p9 | updated |
#+---------------+------+------+-----------+-------------+--------------------+---------------------------------------------------------------------------------------+--------+--------+----------+--------------+----------+--------+-------+------------+------+----+----+----+----+----+----+----+----+---------+
#| primary-links | 1992 |    0 | node/1202 | node/%      | PROBAR PAGINA MENU | a:1:{s:8:"langcode";s:2:"es";}                                                        | menu   |      0 |        0 |            0 |        0 |      0 |     1 |          1 | 1992 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |
#| primary-links | 1991 |    0 | node/1201 | node/%      | TEST PAGE MENU     | a:2:{s:10:"attributes";a:1:{s:5:"title";s:19:"This is a test page";}s:5:"alter";b:1;} | menu   |      0 |        0 |            0 |        0 |      0 |     1 |          0 | 1991 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |  0 |       0 |

  end
end
