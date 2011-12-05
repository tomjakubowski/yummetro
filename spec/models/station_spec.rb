require 'spec_helper'

describe Station do
  it "should require a name" do
    nameless = Station.new(:name => "")
    nameless.should_not be_valid
  end

  it "should not allow a duplicate name" do
    union = Station.create!(:name => "Union Station")
    union = Station.new(:name => "Union Station")
    union.should_not be_valid
  end

  it "should provide an appropriate short name" do
    western = Station.new(:name => "Western Station")
    western.short_name.should == "Western"
  end

  it "should not shorten a special station name" do
    union = Station.new(:name => "Union Station")
    union.short_name.should == "Union Station"
  end

  it "should have a find_by_name_case_insensitive method" do
    Station.should respond_to(:find_by_name_case_insensitive)
  end

  it "should find a station regardless of case" do
    union = Station.create!(:name => "Union Station")
    Station.find_by_name_case_insensitive("uNiOn StAtIon").should == union
  end

  describe "served lines" do
    before(:each) do
      @line = Factory(:line)
      @another_line = Factory(:line, :name => "Foo Line")
      @station = Factory(:station)
      @line.add_stop!(@station)
      @another_line.add_stop!(@station)
    end

    it "should have a serving? method" do
      @station.should respond_to(:serving?)
    end

    it "should have a transfers_from method" do
      @station.should respond_to(:transfers_from)
    end

    it "should include another line serving that station in the list of transfers" do
      @station.transfers_from(@line).should include(@another_line)
    end

    it "should exclude the given line from the list of transfers" do
      @station.transfers_from(@line).should_not include(@line)
    end
  end

  describe "slug" do
    before(:each) do
      @station = Station.create!(:name => "Foo Bar Station", :latitude => 0.0, :longitude => 0.0)
    end

    it "should have a slug method" do
      @station.should respond_to(:slug)
    end

    it "should slugify the short name" do
      @station.slug.should == "foo-bar"
    end
  end
end
