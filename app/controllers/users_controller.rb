class UsersController < ApplicationController
  get '/users/home' do
    if is_logged_in?
      erb :"users/index"
    else
      redirect '/login'
    end
  end
end
