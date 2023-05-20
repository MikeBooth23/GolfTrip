class ChangeColumnInDateComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :date_comments, :trip_date, :trip_date_id
    change_column :date_comments, :trip_date_id, :integer
  end
end
