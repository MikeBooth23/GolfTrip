class RenameDateToDateTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :dates, :datetable
  end
end
