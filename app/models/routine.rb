class Routine < ActiveRecord::Base
  belongs_to :user
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises

  validates :name, presence: true
  validates_associated :exercises
end
