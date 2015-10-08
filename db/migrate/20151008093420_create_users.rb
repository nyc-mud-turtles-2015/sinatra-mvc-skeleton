class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, length: {minimum: 6, maximum: 12}, uniqueness: true
      t.string :password, null: false, length: {minimum: 8, maximum: 20}
      t.timestamps null: false
    end
  end
end
