# frozen_string_literal: true

class Interest < ApplicationRecord
  default_scope { order("#{table_name}.name DESC") }
  has_and_belongs_to_many :users
end
