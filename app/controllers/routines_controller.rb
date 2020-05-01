class RoutinesController < ApplicationController
  get '/routines' do
    #binding.pry
    erb :"routines/index"
  end

  get '/routines/new' do
    
  end
end
