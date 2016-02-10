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
    expect(@user.username).to eq("johndoe")
  end

  it "has an email" do
    expect(@user.email).to eq("example@abc.com")
  end

  it "has a password" do
    expect(@user.password).to eq("validpw")
  end

  it "has many tweets" do
    @user.tweets << @tweet1
    @user.tweets << @tweet2
    expect(@user.tweets).to include(@tweet1)
    expect(@user.tweets).to include(@tweet2)
  end


end
