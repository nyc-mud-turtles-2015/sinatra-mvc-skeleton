class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, length: {maximum: 50}
      t.string :url, null: false, format: {with: /http(|s):\/\/.+\.(com|org|net|gov)/,
            message: "your url should include http prefix and proper domain suffix"}
      t.string :base_url
      t.string :body
      t.timestamps null: false
    end
  end
end
