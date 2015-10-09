class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string  :name
      t.integer :user_id, uniqueness: true
      t.references :voteable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
