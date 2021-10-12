module Mutations
  class UpdatePlaylistDefaultBpm < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, ID, required: true
    argument :default_bpm, Integer, required: false
    argument :key, String, required: true

    def resolve(id:, default_bpm: nil, key:)
      playlist = Playlist.find(id)
      
      playlist.assign_attributes(default_bpm: default_bpm)

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
