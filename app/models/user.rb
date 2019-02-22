# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :interests
  belongs_to :event
  belongs_to :cluster
  belongs_to :location
  validates :phone_number, presence: true
end
