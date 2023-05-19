class RenameColumnInDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :dates, :date, :date_value
  end
end
