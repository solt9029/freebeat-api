class Video < ApplicationRecord
  belongs_to :playlist

  validates :youtube_video_id, presence: true, uniqueness: { scope: :playlist }

  def authorize_and_save(key)
    self.playlist.authorize(key)
    self.save!
  end
end
