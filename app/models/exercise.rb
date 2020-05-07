class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :name, :sets, :reps, presence: true
end
