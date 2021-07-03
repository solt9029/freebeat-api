module Types
  class PlaylistType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :default_bpm, Integer, null: true
    field :videos, VideoType.connection_type, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
