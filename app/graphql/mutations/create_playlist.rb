module Mutations
  class CreatePlaylist < BaseMutation
    field :playlist, Types::PlaylistTypes::Detail, null: false

    def resolve
      playlist = Playlist.create!
      { playlist: playlist }
    end
  end
end
