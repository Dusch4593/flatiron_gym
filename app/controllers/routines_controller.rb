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
    @new_exercise = @routine.exercises.build(name: params[:new_exercise].first[:name],
                                 exercise_type: params[:new_exercise].first[:exercise_type],
                                 description: params[:new_exercise].first[:description],
                                 sets: params[:new_exercise].first[:sets],
                                 reps: params[:new_exercise].first[:reps])
    

    if (!params[:exercise_ids].nil? || @new_exercise.save) && @routine.save
      params[:exercise_ids].each do |exercise_id|
        @exercise = Exercise.find_by_id(exercise_id)
        @routine.exercises << @exercise
      end if !params[:exercise_ids].nil?
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
    if is_logged_in?
      @routine = Routine.find_by_id(params[:id])
      @exercises = Exercise.all
      @exercises = @exercises.each { |e| e.name.downcase.strip }
                             .uniq! { |e| e.name }
                             .each { |e| e.name.capitalize! }
      erb :"routines/edit"
    else
      redirect '/login'
    end

  end

  patch '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    @new_exercise = @routine.exercises.build(name: params[:new_exercise].first[:name],
                                 exercise_type: params[:new_exercise].first[:exercise_type],
                                 description: params[:new_exercise].first[:description],
                                 sets: params[:new_exercise].first[:sets],
                                 reps: params[:new_exercise].first[:reps])
    if @new_exercise.save
      @routine.exercises << @new_exercise
    end
    params.delete("_method")
    if params.include?(:exercise_ids) && @routine.update(name: params[:name], times_per_week: params[:times_per_week])
      params[:exercise_ids].each do |exercise_id|
        @exercise = Exercise.find_by_id(exercise_id)
        @routine.exercises << @exercise
      end
      redirect "/routines/#{@routine.id}"
    else
      redirect "/routines/#{@routine.id}/edit"
    end
  end

  delete '/routines/:id' do
      @routine = Routine.find_by_id(params[:id])
      @routine.destroy
      redirect '/routines'
  end
end
