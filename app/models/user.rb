 require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_secure_password

  validates :username, :presence => true
  validates :password, :presence => true
  has_many :comments
  has_many :posts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end
end
