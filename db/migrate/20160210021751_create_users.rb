# Users should have a username, email, and password, and have many tweets.

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
    end
  end
end
