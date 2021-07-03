class Playlist < ApplicationRecord
  has_many :videos

  before_create :assign_key

  private 
  
  def assign_key
    self.key = SecureRandom.urlsafe_base64.slice(0..4)
  end
end
