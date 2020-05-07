class Exercise < ActiveRecord::Base
  belongs_to :routine_exercises
  has_many :routines, through: :routine_exercises

  validates :name, :sets, :reps, presence: true
  validates :name, uniqueness: true
end
