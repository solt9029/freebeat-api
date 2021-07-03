module Mutations
  class CreateVideo < BaseMutation
    field :video, Types::VideoType, null: false

    argument :video_id, String, required: true
    argument :playlist_id, Integer, required: true
    argument :key, String, required: true

    def resolve(video_id:, playlist_id:, key:)
      video = Video.new(video_id: video_id, playlist_id: playlist_id)

      video.authorize_and_save(key)
      { video: video }
    end
  end
end
