class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email = email.downcase}

  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: 30}
  validates :password, presence: true, length: {minimum: 3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
