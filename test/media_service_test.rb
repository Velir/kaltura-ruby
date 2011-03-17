require 'test_helper'

class MediaServiceTest < Test::Unit::TestCase
  
  def setup
    super()
    media_entry = Kaltura::MediaEntry.new
    media_entry.media_type = Kaltura::Constants::Media::Type::VIDEO
    video_file = File.open("test/media/test.mov")
    video_token = @client.media_service.upload(video_file)
    @created_entry = @client.media_service.add_from_uploaded_file(media_entry,video_token)
  end
  
  # test upload 
  should "media service should upload and add a video file" do
      assert_not_nil @created_entry.id
  end
   
  # test delete entry 
  should "media service should delete the given entry" do
  	  assert_nil @client.media_service.delete(@created_entry.id)
  end
    
    # test adding media entry data
  should "media service should update media data" do
        media_entry = Kaltura::MediaEntry.new
     	  media_entry.name = 'Media Service Test File'
     	  @client.media_service.update(@created_entry.id, media_entry)
     	  updated_entry = @client.media_service.get(@created_entry.id)
     	  assert_equal updated_entry.name, 'Media Service Test File'
  end
  
end
