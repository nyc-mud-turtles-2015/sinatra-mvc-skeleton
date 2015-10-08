class User < ActiveRecord::Base
  validates :username, :presence => true
  has_many :comments
  has_many :posts
end
