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
    if is_logged_in?
      @exercises = Exercise.all
      erb :"routines/new"
    else
      redirect '/login'
    end
  end

  post '/routines' do
    @routine = current_user.routines.build(name: params[:name], times_per_week: params[:times_per_week])



    @new_exercise = @routine.exercises.build(name: params[:new_exercise].first[:name],
                                 exercise_type: params[:new_exercise].first[:exercise_type],
                                 description: params[:new_exercise].first[:description],
                                 sets: params[:new_exercise].first[:sets],
                                 reps: params[:new_exercise].first[:reps])

    @new_exercise.valid? ? @new_exercise.save : @routine.exercises.each { |exercise| @routine.exercises.destroy(exercise) if exercise.invalid? }



    if params.include?(:exercise_ids)
      params[:exercise_ids].each do |exercise_id|
        @exercise = Exercise.find_by_id(exercise_id)
        @routine.exercises << @exercise
      end
    end

    if @routine.save && @routine.exercises.count > 0
      redirect '/routines'
    else
      redirect '/routines/new'
    end
  end

  get '/routines/:id' do
    if is_logged_in?
      @routine = Routine.find_by_id(params[:id])
      @exercises = @routine.exercises
      erb :"routines/show"
    else
      redirect '/login'
    end
  end

  get '/routines/:id/edit' do
    if is_logged_in?
      @routine = Routine.find_by_id(params[:id])
      @exercises = Exercise.all

      erb :"routines/edit"
    else
      redirect '/login'
    end

  end

  patch '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
    params.delete("_method")

    if params.include?(:exercise_ids) && @routine.update(name: params[:name], times_per_week: params[:times_per_week])

      @routine.exercises = []

      params[:exercise_ids].each do |exercise_id|
        @exercise = Exercise.find_by_id(exercise_id)
        @routine.exercises << @exercise
      end

      @new_exercise = @routine.exercises.build(name: params[:new_exercise].first[:name],
                                   exercise_type: params[:new_exercise].first[:exercise_type],
                                   description: params[:new_exercise].first[:description],
                                   sets: params[:new_exercise].first[:sets],
                                   reps: params[:new_exercise].first[:reps])

      @new_exercise.valid? ? @new_exercise.save : @routine.exercises.each { |exercise| @routine.exercises.destroy(exercise) if !exercise.valid? }

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
