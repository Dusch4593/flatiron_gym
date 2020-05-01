class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
      t.text :description
      t.integer :sets
      t.integer :reps
      t.integer :routine_id
      t.timestamps
    end
  end
end
