class City < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user
  belongs_to :convention

  validates :geoname_id, uniqueness: true
end
