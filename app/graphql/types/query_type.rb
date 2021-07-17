module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :playlists, Types::PlaylistTypes::Base.connection_type, null: false do
      argument :keyword, String, required: false
    end
    def playlists(keyword: nil)
      playlist_relation = Playlist.all.joins(:videos).distinct

      if keyword.present?
        playlist_relation = playlist_relation.where("title like ?", "%#{keyword}%") 
      end

      playlist_relation
    end

    field :playlist, Types::PlaylistTypes::Base, null: false do
      argument :id, Int, required: true
    end
    def playlist(id:)
      playlist = Playlist.preload(:videos).find(id)

      # assign youtube video titles
      details = YoutubeService.fetch_video_details(playlist.videos.map(&:youtube_video_id).uniq)
      playlist.videos.each do |video|
        detail = details.find { |detail| detail["id"] == video.youtube_video_id }
        if detail
          video.youtube_video_title = detail["snippet"]["title"]
        end
      end

      playlist
    end
  end
end
