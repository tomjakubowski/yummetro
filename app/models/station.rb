class Station < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude

  validates :name, :presence => :true
end
