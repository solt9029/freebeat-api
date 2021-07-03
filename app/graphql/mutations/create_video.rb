module Mutations
  class CreateVideo < BaseMutation
    field :video, Types::VideoType, null: false

    argument :video_id, String, required: true
    argument :playlist_id, Integer, required: true

    def resolve(video_id:, playlist_id:)
      video = Video.create!(video_id: video_id, playlist_id: playlist_id)
      { video: video }
    end
  end
end
