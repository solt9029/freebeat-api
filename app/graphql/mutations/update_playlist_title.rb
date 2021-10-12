module Mutations
  class UpdatePlaylistTitle < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :key, String, required: true

    def resolve(id:, title:, key:)
      playlist = Playlist.find(id)
      
      playlist.assign_attributes(title: title)

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
