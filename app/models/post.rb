class Post < ActiveRecord::Base
  validates :title, presence: true, length: {maximum: 50}
  validates :url, presence: true, format: {with: /http(|s):\/\/.+\.(com|org|net|gov)/,
      message: "your url should include http prefix and proper domain suffix"}
  belongs_to :user
  has_many :comments, :dependent => :destroy

  has_many :votes, :as => :voteable, :dependent => :destroy
end
