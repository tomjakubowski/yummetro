class Stop < ActiveRecord::Base
  attr_accessible :station_id, :line_id

  belongs_to :line
  belongs_to :station

  validates_uniqueness_of :station_id, :scope => [:line_id], :message => "is already a stop on this line."
end
