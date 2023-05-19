class AddUserIdToDateVote < ActiveRecord::Migration[6.0]
  def change
      add_column :date_votes, :user_id, :integer
  end
end
