require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    #if !!session[:id]
    #  redirect to '/tweets'
    #end
    #binding.pry
    redirect to '/tweets' if Helpers.is_logged_in?(session)
    erb :'users/create_user'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    end
    # create new user
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    #binding.pry
    if user.save
      session[:id] = user.id
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  get '/tweets' do
    #if !!session[:id]
    redirect to '/' unless Helpers.is_logged_in?(session)

    @user = User.find(session[:id])
    @session = session
    @tweets = Tweet.all
    erb :'tweets/tweets'
    #else
    #  redirect to '/'
    #end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect '/tweets'
    else
        redirect '/login'
    end
  end

end

class Helpers
  def self.current_user(session)
    User.find(session[:id])
  end

  def self.is_logged_in?(session)
    #return false if session[:id] == nil
    session[:id] != nil && !!self.current_user(session)
  end
end
