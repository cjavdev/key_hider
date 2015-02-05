class User < ActiveRecord::Base
  validates :uid, :provider, :email, :name, :session_token, presence: true

  before_validation do
    self.session_token ||= SecureRandom.hex
  end

  def self.find_or_create_from_auth_hash(auth_hash, provider)
    u = User.find_by(uid: auth_hash.fetch(:uid), provider: provider)
    return u if u
    case provider
    when "github"
      u = User.create!(
        uid: auth_hash.fetch(:uid),
        email: auth_hash.fetch(:info).fetch(:email),
        name: auth_hash.fetch(:info).fetch(:name),
        nickname: auth_hash.fetch(:info).fetch(:nickname),
        provider: provider
      )
    end
  end

  def reset_session_token!
    self.session_token = SecureRandom.hex
    save!
    session_token
  end
end
