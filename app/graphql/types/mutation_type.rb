module Types
  class MutationType < Types::BaseObject
    field :create_playlist, mutation: Mutations::CreatePlaylist
  end
end
