class User < ActiveRecord::Base
  validates :uid, :provider, :email, :name, :session_token, presence: true
end
