class Video < ApplicationRecord
  belongs_to :playlist

  def authorize_and_save(key)
    self.playlist.authorize(key)
    self.save!
  end
end
