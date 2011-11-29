class Line < ActiveRecord::Base
  attr_accessible :name, :color
  
  validates :name, :presence => :true
end
