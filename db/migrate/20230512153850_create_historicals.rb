class CreateHistoricals < ActiveRecord::Migration[6.0]
  def change
    create_table :historicals do |t|
      t.date :date
      t.string :winning_team
      t.string :losing_team
      t.string :punishment

      t.timestamps
    end
  end
end
