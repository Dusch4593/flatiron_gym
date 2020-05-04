class Exercise < ActiveRecord::Base
  belongs_to :routine

  validates :name, :sets, :reps, presence: true
  validates :name, uniqueness: true
end
