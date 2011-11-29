class Line < ActiveRecord::Base
  attr_accessible :name, :color
  
  validates :name, :presence => :true
  validates_format_of :color, :with => /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
end
