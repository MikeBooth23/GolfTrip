class AddUpvoteToLocationVote < ActiveRecord::Migration[6.0]
  def change
    add_column :location_votes, :upvotes, :integer
  end
end
