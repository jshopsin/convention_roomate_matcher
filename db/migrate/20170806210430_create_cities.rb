class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.integer :geoname_id
      t.string  :continent_code
      t.string  :continent_name
      t.string  :country_name
      t.string  :city_name

      t.timestamps
    end
  end
end
