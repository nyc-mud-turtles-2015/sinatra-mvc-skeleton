class CreatePosts < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps null: false
  end
end
