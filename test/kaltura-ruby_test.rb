require 'test_helper'

class KalturaRubyTest < Test::Unit::TestCase
  
  # simple test to check client session is present
  should "client should not be nil" do
         assert_not_nil @client.ks
 	end

end
