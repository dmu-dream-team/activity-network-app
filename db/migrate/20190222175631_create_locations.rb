# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :nyko_id, null: false, unique: true
      t.string :nyko_name, null: false, unique: true
      t.string :friendly_name, null: false, unique: true

      t.timestamps
    end
  end
end
