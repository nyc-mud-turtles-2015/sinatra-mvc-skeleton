class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  validates :username, :password, presence: true

  has_many :comments
  has_many :posts
  has_many :comment_votes
  has_many :post_votes


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end
end
