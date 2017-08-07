require 'csv'
require 'faker'

def extract_data_for_cities(data)
  { geoname_id: data[:geoname_id], continent_code: data[:continent_code], continent_name: data[:continent_name], country_name: data[:country_name], city_name: data[:city_name] }
end

CSV.foreach("db/data/GeoLite2-City-Locations-en.csv", headers: true, header_converters: :symbol) do |row|
  new_city = City.new(extract_data_for_cities(row))
  new_city.save
end


def find_city(requested_city_name)
  found_city = City.find_by(city_name: "#{requested_city_name}")
  return found_city.id if !found_city.nil?
end

BMES = Convention.new(name: "Biomedical Engineering Society", start_date: '2017-10-11', end_date: '2017-10-14', city_id: find_city("Pheonix"))
BMES.save
PMH = Convention.new(name: "3rd Biennial Perinatal Mental Health Conference", start_date: '2017-11-07', end_date: '2017-11-10', city_id: find_city("Chicago"))
PMH.save

# random arrays needed for creating fake data
random_smoker = ['true', 'false']
random_gender = ['male', 'female', 'other']
random_start_date_BMES = ['2017-10-08', '2017-10-09', '2017-10-10', '2017-10-11', '2017-10-12']
random_end_date_BMES = ['2017-10-12', '2017-10-13', '2017-10-14', '2017-10-15', '2017-10-16', '2017-10-17', '2017-10-18']
random_start_date_PMH = ['2017-11-04', '2017-11-05','2017-11-06','2017-11-07', '2017-11-08']
random_end_date_PMH = ['2017-11-08', '2017-11-09', '2017-11-10', '2017-11-11', '2017-11-12', '2017-11-13', '2017-11-14']

# add lots of fake people for testing - COMMENTED OUT AFTER DATA WAS CREATED
50.times do
  new_user = User.new(name: Faker::Name.name, email: Faker::Internet.email, age: Faker::Number.number(2), city_id: find_city(Faker::Address.city), gender: random_gender.sample, smoker:random_smoker.sample)
  new_user.save if new_user.valid?
  new_user_convention = ConventionUser.new(user_id: new_user.id, convention_id: BMES.id, check_in: random_start_date_BMES.sample, check_out: random_end_date_BMES.sample)
end

50.times do
  new_user = User.new(name: Faker::Name.name, email: Faker::Internet.email, age: Faker::Number.number(2), city_id: find_city(Faker::Address.city), gender: random_gender.sample, smoker:random_smoker.sample)
  new_user.save if new_user.valid?
  new_user_convention = ConventionUser.new(user_id: new_user.id, convention_id: PMH.id, check_in: random_start_date_PMH.sample, check_out: random_end_date_PMH.sample)
end

