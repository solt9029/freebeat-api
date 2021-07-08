class YoutubeService
  BASE_URL = "https://www.googleapis.com".freeze

  def self.fetch_http_response(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do |http|
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
  end

  def self.youtube_video_id_exists?(youtube_video_id)
    params = URI.encode_www_form({ id: youtube_video_id, key: ENV["YOUTUBE_API_KEY"], fields: "items(id)", part: "contentDetails" })
    uri = URI.parse("#{BASE_URL}/youtube/v3/videos?#{params}")
    response = YoutubeService.fetch_http_response(uri)
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
    response = YoutubeService.fetch_http_response(uri)

    if response.code == "200"
      JSON.parse(response.body)["items"].map { |item| item["contentDetails"]["videoId"] }
    else
      Rails.logger.info(response)
      []
    end
  rescue => exception
    Rails.logger.error(exception)
    []
  end

  def self.fetch_video_details(video_ids)
    params = URI.encode_www_form({ id: video_ids.join(","), key: ENV["YOUTUBE_API_KEY"], part: "id,snippet" })
    uri = URI.parse("#{BASE_URL}/youtube/v3/videos?#{params}")
    puts uri
    response = YoutubeService.fetch_http_response(uri)
    puts response.code
    if response.code == "200"
      JSON.parse(response.body)["items"]
    else
      Rails.logger.info(response)
      []
    end
  rescue => exception
    Rails.logger.error(exception)
    []
  end
end
