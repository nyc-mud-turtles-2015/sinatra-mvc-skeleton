class CreatePostVote < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :counter
    end
  end
end
