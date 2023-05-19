class RemoveVotesFromLocationVote < ActiveRecord::Migration[6.0]
  def change
    remove_column :location_votes, :votes, :integer
  end
end
