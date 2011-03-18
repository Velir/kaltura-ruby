require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'yaml'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'kaltura'
require 'kaltura/kaltura_client'



class Test::Unit::TestCase

  # set up kaltura config
  def setup
    config = YAML.load_file("config/server.yml")
    login_email = config["test"]["login_email"]
    login_password = config["test"]["login_password"]
    partner_id = config["test"]["partner_id"]
    subpartner_id = config["test"]["subpartner_id"]
    administrator_secret = config["test"]["administrator_secret"]
    user_secret = config["test"]["user_secret"]
    service_url = config["test"]["service_url"]

    config = Kaltura::Configuration.new(partner_id, service_url)
    @client = Kaltura::Client.new( config )
    session = @client.session_service.start( administrator_secret, '', Kaltura::Constants::SessionType::ADMIN )
    @client.ks = session
  end
  
  

end
