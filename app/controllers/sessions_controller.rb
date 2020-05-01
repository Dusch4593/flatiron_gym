class SessionsController < ApplicationController
  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/users/home'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
