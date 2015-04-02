
require 'ooor'
module Config
  def full_path
    'http://localhost:8069/api/iqc'
  end

  def token
    '1427357621450616'
  end
  def odoo
    @url = 'http://localhost:8069/xmlrpc'
    @username = 'admin'
    @password = 'admin'
    @database = 'bhs_development'
    Ooor.new(:url => @url, :username => @username, :password => @password, :database => @database)
  end
end