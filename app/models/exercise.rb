class Exercise < ActiveRecord::Base
  belongs_to :routine

  validates :name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
end
