module Mutations
  class CreatePlaylist < BaseMutation
    field :playlist, Types::PlaylistType, null: false

    def resolve
      playlist = Playlist.create!
      { playlist: playlist }
    end
  end
end
