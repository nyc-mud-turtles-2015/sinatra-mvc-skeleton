class CommentVote < ActiveRecord::Base
  has_many :votes, as: :voteable
end
