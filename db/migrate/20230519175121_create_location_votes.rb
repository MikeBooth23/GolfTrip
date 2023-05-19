class CreateLocationVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :location_votes do |t|
      t.integer :location_id
      t.integer :user_id
      t.integer :votes

      t.timestamps
    end
  end
end
