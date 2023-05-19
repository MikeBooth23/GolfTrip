class AddNewColumnToDateVote < ActiveRecord::Migration[6.0]
  def change
    add_column :date_votes, :date_id, :integer
  end
end
