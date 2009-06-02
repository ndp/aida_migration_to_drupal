module DrupalBase

  def self.included(base)

    base.establish_connection(
        :adapter  => "mysql",
            :host     => "localhost",
            :username => "root",
            :password => "",
            :database => "aida_drupal",
            :encoding => "utf8"
    )
  end

end