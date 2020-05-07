class ExercisesController < ApplicationController
  get '/exercises' do
    if is_logged_in?
      @exercises = current_user.exercises
      erb :"exercises/index"
    else
      redirect '/login'
    end
  end

  get '/exercises/new' do
    if is_logged_in?
      erb :"exercises/new"
    else
      redirect '/login'
    end
  end

  post '/exercises' do
    @new_exercise = current_user.exercises.build(name: params[:name], exercise_type: params[:exercise_type],
                                                 times_per_week: params[:times_per_week], description: params[:description],
                                                 sets: params[:sets], reps: params[:reps])

    if @new_exercise.valid?
      binding.pry
      @new_exercise.save
      redirect '/exercises'
    else
      binding.pry
      redirect '/exercises/new'
    end
  end

  get '/exercises/:id' do
    if is_logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      erb :"exercises/show"
    else
      redirect '/login'
    end
  end

  get '/exercises/:id/edit' do
    if is_logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      erb :edit
    else
      redirect '/login'
    end
  end

  patch '/exercises/:id' do
    @exercise = Exercise.find_by_id(params[:id])
    params.delete("_method")
    if current_user.id == @exercise.user_id && @exercise.update(name: params[:name], exercise_type: params[:exercise_type], times_per_week: params[:times_per_week], description: params[:description], sets: params[:sets], reps: params[:reps])
      redirect "/exercises/#{@exercise.id}"
    else
      redirect "/exercises/#{@exercise.id}"
    end
  end

  delete '/exercises/:id' do
      @exercise = Exercise.find_by_id(params[:id])
      @exercise.destroy
      erb :"exercises/index"
  end
end
