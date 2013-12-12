class User < ActiveRecord::Base
  attr_accessible :username, :email, :password
  attr_reader :password

  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  after_initialize :ensure_session_token

  belongs_to(
    :shower_users,
    class_name: "Convo",
    foreign_key: :shower_user,
    primary_key: :id
  )

  belongs_to(
    :show_users,
    class_name: "Convo",
    foreign_key: :show_user,
    primary_key: :id
  )

  has_many(
    :transactions,
    class_name: "Transaction",
    foreign_key: :user_id,
    primary_key: :id
  )


  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
