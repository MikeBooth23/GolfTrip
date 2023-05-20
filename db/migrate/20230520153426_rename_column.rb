class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :date_comments, :author, :author_id
  end
end
