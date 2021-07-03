module Types
  class MutationType < Types::BaseObject
    field :create_video, mutation: Mutations::CreateVideo
    field :create_playlist, mutation: Mutations::CreatePlaylist
  end
end
