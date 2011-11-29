require 'spec_helper'

describe Stop do
  before(:each) do
    @station = Factory(:station)
    @line = Factory(:line)
    @stop = @line.stops.build(:station_id => @station)
  end
  
  it "should create a new stop given valid attributes" do
    @stop.save!
  end
end
