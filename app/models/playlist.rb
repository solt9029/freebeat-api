class Playlist < ApplicationRecord
  has_many :videos
  before_create :assign_key
  validates :default_bpm, presence: true

  def authorize(key)
    if key != self.key
      raise AuthorizationError.new("編集キーが不正な値です")
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
