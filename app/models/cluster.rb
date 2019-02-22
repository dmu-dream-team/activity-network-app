# frozen_string_literal: true

class Cluster < ApplicationRecord
  has_many :users
end
