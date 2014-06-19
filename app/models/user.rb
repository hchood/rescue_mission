class User < ActiveRecord::Base
  validates :provider, presence: true
  validates :uid, presence: true

  def self.find_or_create_from_auth_hash(auth_hash)
    user = self.where(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid]).first

    if !user
      attrs = {
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        email: auth_hash[:info][:email]
      }
      user = User.create(attrs)
    end

    user
  end
end
