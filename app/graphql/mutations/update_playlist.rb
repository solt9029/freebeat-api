module Mutations
  class UpdatePlaylist < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :default_bpm, Integer, required: false
    argument :key, String, required: true

    def resolve(id:, title: nil, default_bpm: nil, key:)
      playlist = Playlist.find(id)
      
      playlist.title = title if title.present?
      playlist.default_bpm = default_bpm if default_bpm.present?

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
