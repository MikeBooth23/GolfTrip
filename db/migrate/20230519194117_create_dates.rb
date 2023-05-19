class CreateDates < ActiveRecord::Migration[6.0]
  def change
    create_table :dates do |t|
      t.column :date, :date
      t.column :upvotes, :integer
      t.column :downvotes, :integer
      t.timestamps
    end
  end
end
