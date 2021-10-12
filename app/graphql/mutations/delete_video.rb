module Mutations
  class DeleteVideo < BaseMutation
    field :playlist, Types::PlaylistTypes::Base, null: false

    argument :id, ID, required: true
    argument :key, String, required: true

    def resolve(id:, key:)
      video = Video.find(id)
      playlist = video.playlist

      playlist.authorize(key)

      video.destroy!

      { playlist: playlist }
    end
  end
end
