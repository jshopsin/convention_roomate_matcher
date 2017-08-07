class User < ApplicationRecord
  # Remember to create a migration!
  has_many :conventions, through: :conventions_users, source: :conventions

  validates :email, presence: true, uniqueness: true
end
