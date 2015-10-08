class User < ActiveRecord::Base
  validates :username, presence: true , length: {minimum: 6, maximum: 12}, uniqueness: true
  validates :password, presence: false, length: {minimum: 8, maximum: 20}

  has_many :posts#, through: "join_table"
  has_many :comments#, through: "join_table"
end
