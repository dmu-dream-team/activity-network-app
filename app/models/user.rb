# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :interests
  validates :phone_number, presence: true
end
