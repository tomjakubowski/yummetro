class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :line_id
      t.integer :station_id

      t.timestamps
    end
    
    add_index :stops, :line_id
    add_index :stops, :station_id
    add_index :stops, [:line_id, :station_id], :unique => :true
  end
end
