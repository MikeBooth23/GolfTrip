class CreateUpcomings < ActiveRecord::Migration[6.0]
  def change
    create_table :upcomings do |t|
      t.string :location
      t.string :image
      t.string :price_range
      t.integer :votes

      t.timestamps
    end
  end
end
