class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  has_one :user
  has_one :post
end
