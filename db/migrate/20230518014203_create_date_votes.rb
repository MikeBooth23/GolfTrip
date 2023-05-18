class CreateDateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :date_votes do |t|
      t.date :date
      t.string :votes

      t.timestamps
    end
  end
end
