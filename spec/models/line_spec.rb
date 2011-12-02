require 'spec_helper'

describe Line do
  it "should require a name" do
    nameless = Line.new(:name => "")
    nameless.should_not be_valid
  end

  it "should reject a poorly formatted color" do
    lazycolor = Line.new(:name => "Gold Line", :color => "gold")
    lazycolor.should_not be_valid
  end

  it "should accept a well formatted color" do
    hexcolor = Line.new(:name => "Gold Line", :color => "#FDB913")
    hexcolor.should be_valid
  end

  describe "station stops" do
    before(:each) do
      @line = Factory(:line)
      @station = Factory(:station)
    end

    it "should have a stops method" do
      @line.should respond_to(:stops)
    end

    it "should have a stations method" do
      @line.should respond_to(:stations)
    end

    it "should have a stopping_at? method" do
      @line.should respond_to(:stopping_at?)
    end

    it "should have an add_stop! method" do
      @line.should respond_to(:add_stop!)
    end

    it "should add a new stop" do
      @line.add_stop!(@station)
      @line.should be_stopping_at(@station)
    end

    it "should include the new stop's station in its stations array" do
      @line.add_stop!(@station)
      @line.stations.should include(@station)
    end

    it "should have a remove_stop! method" do
      @line.should respond_to(:remove_stop!)
    end

    it "should remove a stop" do
      @line.add_stop!(@station)
      @line.remove_stop!(@station)
      @line.should_not be_stopping_at(@station)
    end

  describe "stations"
    before(:each) do
      @line = Factory(:line)
      @station1 = Factory(:station)
      @station2 = Factory(:station, :name => "Bunion Station")
      @line.add_stop!(@station2)
      @line.add_stop!(@station1)
    end

    it "should sort stations by the ordering of stops" do
      @line.stations.should == [@station2, @station1]
    end
  end
end
