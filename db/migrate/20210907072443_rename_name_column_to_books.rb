class RenameNameColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :cooks, :name, :title
  end
end
