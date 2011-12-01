require 'spec_helper'

describe Business do
  before(:each) do
    @attr = {
      :name => "Moe's Tavern",
      :phone => "(555) 764-8437",
      :display_address => ["555 Fake St.", "Springfield, XX 69420"],
      :distance => 1000
    }
  end

  it "should require a name" do
    nameless = Business.new(@attr.merge(:name => ""))
    nameless.should_not be_valid
  end

  it "should require a display address" do
    nowhere = Business.new(@attr.merge(:display_address => nil))
    nowhere.should_not be_valid
  end

  it "should require a distance from the search location" do
    nodist = Business.new(@attr.merge(:distance => nil))
    nodist.should_not be_valid
  end

  it "should be valid given valid attributes" do
    moes = Business.new(@attr)
    moes.should be_valid
  end
end