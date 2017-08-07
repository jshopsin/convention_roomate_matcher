class ConventionUser < ApplicationRecord
  # Remember to create a migration!
  has_many :users
  has_many :conventions

  validates :users, :conventions, presence: true
end
