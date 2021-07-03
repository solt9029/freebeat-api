class Playlist < ApplicationRecord
  has_many :videos

  before_create :assign_key

  def authorize(key)
    if key != self.key
      raise
    end
  end

  def authorize_and_save(key)
    self.authorize(key)
    self.save!
  end

  private 

  def assign_key
    self.key = SecureRandom.urlsafe_base64.slice(0..4)
  end
end
