class RenameDateTableToDateTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :datetable, :datetables
  end
end
