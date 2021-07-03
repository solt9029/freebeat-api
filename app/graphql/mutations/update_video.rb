module Mutations
  class UpdateVideo < BaseMutation
    field :video, Types::VideoType, null: false

    argument :id, Integer, required: true
    argument :bpm, Integer, required: true
    argument :key, String, required: true

    def resolve(id:, bpm:, key:)
      video = Video.find(id)

      video.assign_attributes(bpm: bpm)
      
      video.authorize_and_save(key)
      { video: video }
    end
  end
end
