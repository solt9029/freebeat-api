class Video < ApplicationRecord
  attr_accessor :youtube_video_title

  belongs_to :playlist

  validates :youtube_video_id, presence: true, uniqueness: { scope: :playlist }
  validates_associated :playlist

  def authorize_and_save(key)
    self.playlist.authorize(key)
    self.save!
  end
end
