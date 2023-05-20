class RemoveColumnFromDateVote < ActiveRecord::Migration[6.0]
  def change
    remove_column :date_votes, :date
  end
end
