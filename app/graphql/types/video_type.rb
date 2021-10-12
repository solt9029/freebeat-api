module Types
  class VideoType < Types::BaseObject
    field :id, Integer, null: false
    field :youtube_video_id, String, null: false
    field :youtube_video_title, String, null: true
    field :bpm, Integer, null: true
    field :playlist_id, Integer, null: false
    field :playlist, Types::PlaylistTypes::Base, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
