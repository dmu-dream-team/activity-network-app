# frozen_string_literal: true

class AddRsvpToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rsvp, :boolean, default: false
  end
end
