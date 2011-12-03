class AddSlugToLine < ActiveRecord::Migration
  def change
    add_column :lines, :slug, :string
    add_index :lines, :slug, :unique => true
  end
end
