class AddSlugIndexToStations < ActiveRecord::Migration
  def change
    add_index :stations, :slug, :unique => :true
  end
end
