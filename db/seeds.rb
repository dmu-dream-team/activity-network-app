# frozen_string_literal: true

# Seeds file

## Locations
locations_file = File.read("#{Rails.root}/db/location_data_seed.yml")
locations = YAML.safe_load(locations_file)['locations']

locations.each do |location|
  next if Location.find_by(nyko_id: location['nyko_id'])

  puts "inserting #{location['friendly_name']}"
  puts "inserting failed for #{location['nyko_id']}" unless Location.create(location)
end
