# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number, null: false
      t.string :address
      t.integer :rating

      t.timestamps
    end
  end
end
