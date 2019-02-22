class AddClusterIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :cluster, foreign_key: true
  end
end
