class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :trip
      t.string :image
      t.string :description
      t.string :votes

      t.timestamps
    end
  end
end
