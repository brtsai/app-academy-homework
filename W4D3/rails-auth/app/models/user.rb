class User < ApplicationRecord
  before_validation :ensure_session_token, on: :create

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Need a password" }
  validates :password, length: { minimum: 6 }, allow_nil: true

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    bc_pass = BCrypt::Password.new(user.password_digest)
    if bc_pass.is_password?(password)
      return user
    else
      raise "Wrong password"
    end
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end
end
