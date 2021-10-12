module Mutations
  class UpdatePlaylist < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, ID, required: true
    argument :key, String, required: true
    argument :playlist_input, Types::PlaylistInput, required: true

    def resolve(id:, playlist_input:, key:)
      playlist = Playlist.find(id)
      playlist.assign_attributes(playlist_input.to_params)

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
