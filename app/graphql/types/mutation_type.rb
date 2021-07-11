module Types
  class MutationType < Types::BaseObject
    field :update_playlist_min_playback_rate, mutation: Mutations::UpdatePlaylistMinPlaybackRate
    field :update_playlist_max_playback_rate, mutation: Mutations::UpdatePlaylistMaxPlaybackRate
    field :delete_video, mutation: Mutations::DeleteVideo
    field :update_playlist_title, mutation: Mutations::UpdatePlaylistTitle
    field :update_playlist_default_bpm, mutation: Mutations::UpdatePlaylistDefaultBpm
    field :create_videos, mutation: Mutations::CreateVideos
    field :update_video, mutation: Mutations::UpdateVideo
    field :create_video, mutation: Mutations::CreateVideo
    field :create_playlist, mutation: Mutations::CreatePlaylist
  end
end
