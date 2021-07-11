module Mutations
  class UpdatePlaylistMinPlaybackRate < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, Integer, required: true
    argument :min_playback_rate, Float, required: false
    argument :key, String, required: true

    def resolve(id:, min_playback_rate: nil, key:)
      playlist = Playlist.find(id)
      
      playlist.assign_attributes(min_playback_rate: min_playback_rate)

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
