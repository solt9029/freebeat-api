module Mutations
  class UpdatePlaylist < BaseMutation
    field :playlist, Types::PlaylistType, null: false

    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :default_bpm, Integer, required: false
    argument :key, String, required: true

    def resolve(id:, title:, default_bpm:, key:)
      playlist = Playlist.find(id)
      
      playlist.title = title if title.present?
      playlist.default_bpm = default_bpm if default_bpm.present?

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
