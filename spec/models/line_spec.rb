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
end
