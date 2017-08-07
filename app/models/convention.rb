class Convention < ApplicationRecord
  has_many :users, through: :conventions_users, source: :users
end