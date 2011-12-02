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
end
