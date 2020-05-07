class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
      t.text :description
      t.integer :times_per_week
      t.integer :sets
      t.integer :reps
      t.integer :user_id
      t.timestamps
    end
  end
end
