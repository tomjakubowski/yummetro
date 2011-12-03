class AddSlugToStations < ActiveRecord::Migration
  def change
    add_column :stations, :slug, :string
  end
end
