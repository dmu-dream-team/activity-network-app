# frozen_string_literal: true

class User < ApplicationRecord
  validates :phone_number, presence: true
end