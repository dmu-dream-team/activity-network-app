# frozen_string_literal: true

# Seeds file

## Locations
locations_file = File.read("#{Rails.root}/db/location_data_seed.yml")
locations = YAML.safe_load(locations_file)['locations']

locations.each do |location|
  next if Location.find_by(nyko_id: location['nyko_id'])

  puts "Inserting #{location['friendly_name']}"
  puts "Inserting failed for #{location['nyko_id']}" unless Location.create(location)
end

## Interests

interests_file = File.read("#{Rails.root}/db/interests_data_seed.yml")
interests = YAML.safe_load(interests_file)['interests']

interests.each do |interest|
  next if Interest.find_by(name: interest['name'])

  puts "Inserting #{interest['name']}"
  puts "Inserting failed for #{interest['name']}" unless Interest.create(interest)
end
