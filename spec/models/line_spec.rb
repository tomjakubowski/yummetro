require 'spec_helper'

describe Line do
  it "should require a name" do
    nameless = Line.new(:name => "")
    nameless.should_not be_valid
  end
end
