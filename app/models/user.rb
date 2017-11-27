class User < ApplicationRecord
  validates :provider, :uid, presence: true
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'],
                               provider: auth_hash['provider'])
      user.save!
      user
    end
  end
end
