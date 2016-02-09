require_relative "../lib/kaltura"

partner_id   = 'xxx'
admin_secret = 'xxx'

# Create a client and start a Kaltura Session (ks)
client = Kaltura::Client.new(Kaltura::Configuration.new(partner_id))
client.ks = client.session_service.start(admin_secret, '', Kaltura::Constants::SessionType::ADMIN)

# Create an entry and add content via url
entry = Kaltura::MediaEntry.new
entry.name = "Testing Ruby Client"
entry.media_type = Kaltura::Constants::Media::Type::VIDEO
url = 'https://github.com/kaltura/KalturaGeneratedAPIClientsCsharp/blob/master/KalturaClientTester/DemoVideo.flv';
entry = client.media_service.add_from_url(entry, url);
