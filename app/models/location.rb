# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :users
  validates :nyko_id, :nyko_name, :friendly_name, presence: true
  validates :nyko_id, :nyko_name, :friendly_name, uniqueness: true
end
