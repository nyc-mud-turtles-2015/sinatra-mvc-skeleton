class CreateUsers < ActiveRecord::Migration
  def change

    validates: :username, :presence => true

    create_table :users do |t|
      t.string :username
      t.string :password_hash

      t.timestamps null: false

    end
  end
end
