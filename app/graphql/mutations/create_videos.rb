module Mutations
  class CreateVideos < BaseMutation
    field :videos, [Types::VideoType], null: false

    argument :youtube_playlist_id, String, required: true
    argument :playlist_id, ID, required: true
    argument :key, String, required: true

    def resolve(youtube_playlist_id:, playlist_id:, key:)
      youtube_video_ids = YoutubeService.fetch_youtube_video_ids(youtube_playlist_id)
      if youtube_video_ids.size == 0
        raise YoutubePlaylistNotFoundError.new("YouTubeプレイリストIDが不正です")
      end

      playlist = Playlist.find(playlist_id)
      playlist.authorize(key)

      videos = []
      ActiveRecord::Base.transaction do
        videos = youtube_video_ids.map do |youtube_video_id|
          Video.create!(youtube_video_id: youtube_video_id, playlist: playlist)
        end
      end

      { videos: videos }
    end
  end
end
