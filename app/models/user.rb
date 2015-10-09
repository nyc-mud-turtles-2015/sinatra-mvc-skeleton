class User < ActiveRecord::Base
  include BCrypt
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true

  has_many :comments, :dependent => :destroy
  has_many :posts, :dependent => :destroy

  # has_many :votes

  def login(user, password)
    user.password == password
  end

  def self.login(args = {})
    user = User.find_by(username: args[:username])
    user.password == password
  end

  def self.register(args = {})
    user = User.find_by(username: args[:username])
    if user.nil?
      user = User.new(username: args[:username], password_hash: args[:password])
      user.password = args[:password]
      return user.save
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
