class RemoveStopUniqueIndex < ActiveRecord::Migration
  def change
    remove_index :stops, [:line_id, :station_id]
  end
end
