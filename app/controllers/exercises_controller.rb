class ExercisesController < ApplicationController
  get '/exercises/:id' do
    if is_logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      @routine_exercise = RoutineExercise.find_by_id(@exercise.id)
      @routine = Routine.find_by_id(@routine_exercise.routine_id)
      erb :"exercises/show"
    else
      redirect '/login'
    end
  end

  get '/exercises/:id/edit' do
    if is_logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      @routine_exercise = RoutineExercise.find_by_id(@exercise.id)
      @routine = Routine.find_by_id(@routine_exercise.routine_id)
      erb :"exercises/edit"
    else
      redirect '/login'
    end
  end

  patch '/exercises/:id' do
    @exercise = Exercise.find_by_id(params[:id])
    @routine_exercise = RoutineExercise.find_by_id(@exercise.id)
    @routine = Routine.find_by_id(@routine_exercise.routine_id)
    params.delete("_method")
    if current_user.id == @routine.user_id && @exercise.update(name: params[:name], exercise_type: params[:exercise_type], description: params[:description], sets: params[:sets], reps: params[:reps])
      redirect "/exercises/#{@exercise.id}"
    else
      redirect "/exercises/#{@exercise.id}"
    end
  end

  delete '/exercises/:id' do
      @exercise = Exercise.find_by_id(params[:id])
      @routine_exercise = RoutineExercise.find_by_id(@exercise.id)
      @routine = Routine.find_by_id(@routine_exercise.routine_id)
      @exercise.destroy
      redirect "/routines/#{@routine.id}"
  end
end
