class AddDownvoteToLocationVote < ActiveRecord::Migration[6.0]
  def change
    add_column :location_votes, :downvotes, :integer
  end
end
