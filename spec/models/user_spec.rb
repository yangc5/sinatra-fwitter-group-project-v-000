require 'spec_helper'

# Users should have a username, email, and password, and have many tweets.
# Tweets should have content, belong to a user.

describe "User" do
  before do
    @user = User.create(:username => "johndoe", :email => "example@abc.com", :password => "validpw")

    @tweet1 = Tweet.create(:content => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

    @tweet2 = Tweet.create(:content => "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
  end

  it "has a username" do
    expect(@user.username).to eq("")
  end


end
