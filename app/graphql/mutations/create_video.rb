module Mutations
  class CreateVideo < BaseMutation
    field :video, Types::VideoType, null: false

    argument :youtube_video_id, String, required: true
    argument :playlist_id, ID, required: true
    argument :key, String, required: true

    def resolve(youtube_video_id:, playlist_id:, key:)
      unless YoutubeService.youtube_video_id_exists?(youtube_video_id)
        raise YoutubeVideoNotFoundError.new("YouTube動画IDが不正です")
      end

      playlist = Playlist.find(playlist_id)
      video = Video.new(youtube_video_id: youtube_video_id, playlist: playlist)

      video.authorize_and_save(key)
      { video: video }
    end
  end
end
