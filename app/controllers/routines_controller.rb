class RoutinesController < ApplicationController
  get '/routines' do
    if is_logged_in?
      @routines = current_user.routines
      erb :"routines/index"
    else
      redirect '/login'
    end
  end

  get '/routines/new' do
    @exercises = Exercise.all
    @exercises = @exercises.each { |e| e.name.downcase.strip }
                           .uniq! { |e| e.name }
                           .each { |e| e.name.capitalize! }
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
    @exercises = @routine.exercises
    erb :"routines/show"
  end

  get '/routines/:id/edit' do
    binding.pry
  end

  patch '/routines' do

  end

  delete '/routines/:id' do
      @routine = Routine.find_by_id(params[:id])
      @routine.destroy
      redirect '/routines'
  end
end
