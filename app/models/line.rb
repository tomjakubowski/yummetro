class Line < ActiveRecord::Base
  attr_accessible :name, :color
  has_many :stops, :dependent => :destroy
  has_many :stations, :through => :stops

  validates :name, :presence => :true
  validates_format_of :color, :with => /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/

  def stopping_at?(station)
    stops.find_by_station_id(station)
  end

  def add_stop!(station)
    stops.create!(:station_id => station.id)
  end

  def remove_stop!(station)
    stops.find_by_station_id(station).destroy
  end
end
