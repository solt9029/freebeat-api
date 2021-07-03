class YoutubeService
  def self.youtube_video_id_exists?(youtube_video_id)
    params = URI.encode_www_form({ id: youtube_video_id, key: ENV["YOUTUBE_API_KEY"], fields: "items(id)", part: "contentDetails" })
    uri = URI.parse("https://www.googleapis.com/youtube/v3/videos?#{params}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.start do |http|
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
    JSON.parse(response.body)["items"].size > 0
  rescue => exception
    Rails.logger.error(exception)
    false
  end
end
