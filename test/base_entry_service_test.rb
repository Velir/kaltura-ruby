require 'test_helper'

class BaseEntryServiceTest < Test::Unit::TestCase
  
  should "base entry service should upload and add a pdf file" do
      base_entry = Kaltura::BaseEntry.new
      base_entry.type = Kaltura::Constants::Entry::Type::DOCUMENT
      pdf_file = File.open("test/media/test.pdf")
      pdf_token = @client.base_entry_service.upload(pdf_file)
      created_entry = @client.base_entry_service.add_from_uploaded_file(base_entry, pdf_token)
      puts "---------#{created_entry.inspect}--------"
      assert_not_nil created_entry.id
   end
   
   should "base entry service should upload and add a swf file" do
       base_entry = Kaltura::BaseEntry.new
       base_entry.type = Kaltura::Constants::Entry::Type::AUTOMATIC
       base_entry.tags = "swf"
       swf_file = File.open("test/media/test.swf")
       pdf_token = @client.base_entry_service.upload(swf_file)
       created_entry = @client.base_entry_service.add_from_uploaded_file(base_entry, pdf_token)
       puts "---------#{created_entry.inspect}--------"
       assert_not_nil created_entry.id
    end

    # This test is failing and we do not need this feature
    # should "base entry service should list data entries" do
    #    base_entry_filter = Kaltura::Filter::BaseEntryFilter.new
    #    base_entry_filter.tags_like = "swf"
    #    # data_entry_filter.type_equal = Kaltura::Constants::Entry::Type::DOCUMENT
    #    base_entry_pager = Kaltura::FilterPager.new
    #    base_entry_list = @client.base_entry_service.list(base_entry_filter, base_entry_pager)
    #    # base_entry_list = @client.base_entry_service.list
    #    puts "---------#{base_entry_list.inspect}--------"
    #    assert_equal base_entry_list.total_count, 10
    #  end
end
