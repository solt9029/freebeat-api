module Types
  class MutationType < Types::BaseObject
    field :update_playlist_title, mutation: Mutations::UpdatePlaylistTitle
    field :update_playlist_default_bpm, mutation: Mutations::UpdatePlaylistDefaultBpm
    field :create_videos, mutation: Mutations::CreateVideos
    field :update_video, mutation: Mutations::UpdateVideo
    field :create_video, mutation: Mutations::CreateVideo
    field :create_playlist, mutation: Mutations::CreatePlaylist
  end
end
