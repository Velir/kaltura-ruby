require 'test_helper'

class MediaServiceTest < Test::Unit::TestCase
  
  # test upload 
  should "media service should upload and add a video file" do
      media_entry = Kaltura::MediaEntry.new
   	  media_entry.media_type = Kaltura::Constants::Media::Type::VIDEO
   	  video_file = File.open("test/media/test.mov")
   	  begin
   	       video_token = @client.media_service.upload(video_file)
   	       @created_entry = @client.media_service.add_from_uploaded_file(media_entry,video_token)
   	       assert_not_nil @created_entry
   	  rescue Kaltura::APIError => e
   	  end
   end
   
   # test delete entry 
   #TODO: improve the test
   should "media service should delete the given entry" do
     media_entry = Kaltura::MediaEntry.new
  	  media_entry.media_type = Kaltura::Constants::Media::Type::VIDEO
  	  video_file = File.open("test/media/test.mov")
  	  begin
  	       video_token = @client.media_service.upload(video_file)
  	       @created_entry = @client.media_service.add_from_uploaded_file(media_entry,video_token)
  	       assert_nil @client.media_service.delete(@created_entry)
  	  rescue Kaltura::APIError => e
  	  end
      
    end
end
