class Node < ActiveRecord::Base
  include DrupalBase

  set_table_name 'node'
  set_primary_key 'nid'

  attr_accessor :body

  self.inheritance_column = :not_single_table_inheritance


  has_many :node_revisions, :foreign_key=>'nid', :primary_key=>:nid

  def link_path(raw = false)
    lp = "node/#{self.nid}"
    return lp if raw
    a = UrlAlias.find(:first, :conditions=>{:src=>lp})
    a ? a.dst : lp
  end

  def router_path
    'node/%'
  end


  def after_create
    node_rev = NodeRevision.new do |nr|
      nr.nid = nid
      nr.vid = nid
      nr.uid = 1
      nr.title = title
      nr.teaser = ''
      nr.timestamp = Time.now()
      #nr.log = 'imported'
      nr.format = 1
      nr.body = body
    end
    node_rev.save!
  end
end

