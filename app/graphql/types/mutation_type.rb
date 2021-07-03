module Types
  class MutationType < Types::BaseObject
    field :create_videos, mutation: Mutations::CreateVideos
    field :update_playlist, mutation: Mutations::UpdatePlaylist
    field :update_video, mutation: Mutations::UpdateVideo
    field :create_video, mutation: Mutations::CreateVideo
    field :create_playlist, mutation: Mutations::CreatePlaylist
  end
end
