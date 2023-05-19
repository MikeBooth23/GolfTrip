class AddDownvoteToUpcoming < ActiveRecord::Migration[6.0]
  def change
    add_column :upcomings, :downvote, :integer
  end
end
