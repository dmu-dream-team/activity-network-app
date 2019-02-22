# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :interests
  belongs_to :event, optional: true
  belongs_to :cluster, optional: true
  belongs_to :location, optional: true
  validates :phone_number, presence: true
end
