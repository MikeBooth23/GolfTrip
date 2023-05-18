class ChangeColumnTypeIndateVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :date_votes, :votes, :integer
  end
end
