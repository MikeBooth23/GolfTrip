class AddUpvoteToUpcoming < ActiveRecord::Migration[6.0]
  def change
    add_column :upcomings, :upvote, :integer
  end
end
