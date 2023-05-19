class AddColumnToDateVote < ActiveRecord::Migration[6.0]
  def change
    add_column :date_votes, :downvotes, :integer
  end
end
