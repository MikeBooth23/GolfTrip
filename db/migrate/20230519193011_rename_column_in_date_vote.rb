class RenameColumnInDateVote < ActiveRecord::Migration[6.0]
  def change
      rename_column :date_votes, :votes, :downvotes
  end
end
