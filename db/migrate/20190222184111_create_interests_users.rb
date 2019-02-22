# frozen_string_literal: true

class CreateInterestsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :interests_users, id: false do |t|
      t.integer :interest_id
      t.integer :user_id
    end
  end
end
