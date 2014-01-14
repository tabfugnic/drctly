class Url < ActiveRecord::Base
  validates :link, presence: true

  before_create :generate_key

  def generate_key
    self.key = SecureRandom.urlsafe_base64(6)
  end


end
