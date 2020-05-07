class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :name, :sets, :reps, presence: true
  validates :name, uniqueness: true
end
