class CreateLocationComments < ActiveRecord::Migration[6.0]
  def change
    create_table :location_comments do |t|
      t.location_id :integer
      t.body :string
      t.author_id :integer
      t.timestamps
    end
  end
end
