module Mutations
  class UpdateVideo < BaseMutation
    field :video, Types::VideoType, null: false

    argument :id, Integer, required: true
    argument :bpm, Integer, required: true

    def resolve(id:, bpm:)
      video = Video.find(id)
      video.update!(bpm: bpm)
      { video: video }
    end
  end
end
