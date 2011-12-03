require 'spec_helper'

describe Line do
  before(:each) do
    @attr = {:name => "Gold Line", :color => "#FDB913"}
  end

  it "should require a name" do
    nameless = Line.new(@attr.merge(:name => ""))
    nameless.should_not be_valid
  end

  it "should reject a poorly formatted color" do
    lazycolor = Line.new(@attr.merge(:color => "gold"))
    lazycolor.should_not be_valid
  end

  it "should be valid given valid attributes" do
    gold = Line.new(@attr)
    gold.should be_valid
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

    it "should sort stations by the ordering of stops" do
      bunion = Factory(:station, :name => "Bunion Station")
      @line.add_stop!(bunion)
      @line.add_stop!(@station)
      @line.stations.should == [bunion, @station]
    end
  end

  describe "slug" do
    before(:each) do
      @slugged = Factory(:line)
    end

    it "should be a method" do
      @slugged.should respond_to(:slug)
    end

    it "should be equal to to_param" do
      @slugged.to_param.should == @slugged.slug
    end
  end
end
