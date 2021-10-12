module Mutations
  class UpdatePlaylistMaxPlaybackRate < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, ID, required: true
    argument :max_playback_rate, Float, required: false
    argument :key, String, required: true

    def resolve(id:, max_playback_rate: nil, key:)
      playlist = Playlist.find(id)
      
      playlist.assign_attributes(max_playback_rate: max_playback_rate)

      playlist.authorize_and_save(key)
      { playlist: playlist }
    end
  end
end
