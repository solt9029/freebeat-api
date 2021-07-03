class YoutubeService
  BASE_URL = "https://www.googleapis.com".freeze

  def self.youtube_video_id_exists?(youtube_video_id)
    params = URI.encode_www_form({ id: youtube_video_id, key: ENV["YOUTUBE_API_KEY"], fields: "items(id)", part: "contentDetails" })
    uri = URI.parse("#{BASE_URL}/youtube/v3/videos?#{params}")
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

  def self.fetch_youtube_video_ids(youtube_playlist_id)
    params = URI.encode_www_form({ 
      playlistId: youtube_playlist_id, 
      key: ENV["YOUTUBE_API_KEY"], 
      part: "id,contentDetails", 
      maxResults: 50 
    })
    uri = URI.parse("#{BASE_URL}/youtube/v3/playlistItems?#{params}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.start do |http|
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end

    if response.code == "200"
      JSON.parse(response.body)["items"].map { |item| item["contentDetails"]["videoId"] }
    else
      []
    end
  rescue => exception
    Rails.logger.error(exception)
    []
  end
end
