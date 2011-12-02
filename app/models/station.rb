class Station < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude
  # If a Station is torn down, no line will stop there right?
  has_many :stops, :dependent => :destroy
  has_many :lines_served, :through => :stops, :source => :line

  validates_presence_of :name
  validates_uniqueness_of :name

  def serving?(line)
    stops.find_by_line_id(line)
  end

  def transfers_from(line)
    lines_served.reject { |l| l == line } if serving? line
  end

  def short_name
    unless short_name_exceptions.include?(self.name)
      self.name.gsub(/ (Station)/, "")
    else
      self.name
    end
  end

  private

  def short_name_exceptions
    ["Union Station"]
  end
end
