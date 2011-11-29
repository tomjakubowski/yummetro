require 'spec_helper'

describe Station do
  it "should require a name" do
    nameless = Station.new(:name => "")
    nameless.should_not be_valid
  end
end
