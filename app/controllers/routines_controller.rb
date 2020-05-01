class RoutinesController < ApplicationController
  get '/routines' do
    @routines = current_user.routines
    erb :"routines/index"
  end

  get '/routines/new' do
    @exercises = Exercise.all
    erb :"routines/new"
  end

  post '/routines' do
    @routine = current_user.routines.build(name: params[:name], times_per_week: params[:times_per_week])
    if (params.include?(:exercise_ids) || !params[:exercises].empty?) && @routine.save
      redirect '/routines'
    else
      redirect '/routines/new'
    end
  end

  get '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    erb :"routines/show"
  end

  delete '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    @routine.destroy
    redirect '/routines'
  end
end
