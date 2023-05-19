class RemoveVotesFromUpcoming < ActiveRecord::Migration[6.0]
  def change
    remove_column :upcomings, :votes, :integer
  end
end
