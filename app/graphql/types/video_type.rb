module Types
  class VideoType < Types::BaseObject
    field :id, ID, null: false
    field :youtube_video_id, String, null: false
    field :bpm, Integer, null: true
    field :playlist_id, Integer, null: false
    field :playlist, PlaylistType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
