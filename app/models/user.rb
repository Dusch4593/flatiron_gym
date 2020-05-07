class User < ActiveRecord::Base
  has_many :routines

  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: { message: "%{value} is already taken.  Please try with another email."}
end
