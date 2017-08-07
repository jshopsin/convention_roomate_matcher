class Convention < ApplicationRecord
  # Remember to create a migration!
  has_many :users, through: :conventions_users, source: :users
end
