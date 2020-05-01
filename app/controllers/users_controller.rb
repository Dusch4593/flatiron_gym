class UsersController < ApplicationController
  get '/users/home' do
    if is_logged_in?
      erb :"users/index"
    else
      redirect '/login'
    end
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      binding.pry
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      redirect '/signup'
    end
  end
end
