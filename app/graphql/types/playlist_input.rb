module Types
  class PlaylistInput < Types::BaseInputObject
    argument :title, String, required: false
    argument :default_bpm, Integer, required: false
    argument :max_playback_rate, Float, required: false
    argument :min_playback_rate, Float, required: false
  end
end
