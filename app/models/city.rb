class City < ApplicationRecord
  belongs_to :user
  belongs_to :convention
end