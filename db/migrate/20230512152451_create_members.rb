class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :nickname
      t.string :hometown
      t.string :bio
      t.string :image

      t.timestamps
    end
  end
end
