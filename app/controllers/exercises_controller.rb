class ExercisesController < ApplicationController
  get '/exercises/:id' do
    if is_logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      @routine = Routine.find_by_id(@exercise.routine_id)
      erb :"exercises/show"
    else
      redirect '/login'
    end
  end
end
