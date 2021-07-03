module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :playlists, Types::PlaylistType.connection_type, null: false
    def playlists
      Playlist.all
    end

    field :playlist, Types::PlaylistType, null: false do
      argument :id, Int, required: true
    end
    def playlist(id:)
      Playlist.find(id)
    end

  end
end
