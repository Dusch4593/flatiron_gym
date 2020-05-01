require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret"
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do
    erb :"users/signup"
  end

  helpers do
    def is_logged_in?
      session.include?(:user_id)
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end
  end
end
