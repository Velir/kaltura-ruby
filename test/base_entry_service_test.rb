require 'test_helper'

class BaseEntryServiceTest < Test::Unit::TestCase
  
  should "base entry service should upload and add a pdf file" do
      base_entry = Kaltura::BaseEntry.new
      base_entry.type = Kaltura::Constants::Entry::Type::DOCUMENT
      pdf_file = File.open("test/media/test.pdf")
      pdf_token = @client.base_entry_service.upload(pdf_file)
      created_entry = @client.base_entry_service.add_from_uploaded_file(base_entry, pdf_token)
      # puts "---------#{created_entry.inspect}--------"
      assert_not_nil created_entry.id
   end
   
   should "base entry service should upload and add a swf file" do
       base_entry = Kaltura::BaseEntry.new
       base_entry.type = Kaltura::Constants::Entry::Type::AUTOMATIC
       swf_file = File.open("test/media/test.swf")
       pdf_token = @client.base_entry_service.upload(swf_file)
       created_entry = @client.base_entry_service.add_from_uploaded_file(base_entry, pdf_token)
       # puts "---------#{created_entry.inspect}--------"
       assert_not_nil created_entry.id
    end
end
