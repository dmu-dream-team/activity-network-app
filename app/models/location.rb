class Location < ApplicationRecord
  validates :nyko_id, :nyko_name, :friendly_name, presence: true
  validates :nyko_id, :nyko_name, :friendly_name, uniqueness: true
end
