module Types
  class PlaylistTypes::Base < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :default_bpm, Integer, null: true
    field :max_playback_rate, Float, null: true
    field :min_playback_rate, Float, null: true
    field :videos, Types::VideoType.connection_type, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
