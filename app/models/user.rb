class User < ApplicationRecord
  has_many :conventions, through: :conventions_users, source: :conventions
end