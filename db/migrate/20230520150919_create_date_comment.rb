class CreateDateComment < ActiveRecord::Migration[6.0]
  def change
    create_table :date_comments do |t|
      t.column :trip_date, :date
      t.column :body, :string
      t.column :author, :integer
      t.timestamps
    end
  end
end
