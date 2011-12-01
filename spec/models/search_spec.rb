require 'spec_helper'

describe Search do
  before(:each) do
    @attr = {:term => "pizza", :station => Factory(:station)}
  end

  it "should require a search term" do
    termless = Search.new(@attr.merge(:term => ""))
    termless.should_not be_valid
  end

  it "should require a station" do
    stationless = Search.new(@attr.merge(:station => nil))
    stationless.should_not be_valid
  end

  it "should be valid given valid attributes" do
    good = Search.new(@attr)
    good.should be_valid
  end

  describe "results" do
    use_vcr_cassette "pizza_union_station", :record => :new_episodes

    before(:each) do
      @pizza = Search.new(@attr)
    end

    it "should have a fetch_results method" do
      @pizza.should respond_to(:fetch_results)
    end

    it "should fetch some results" do
      @pizza.fetch_results.should include('businesses')
    end
  end
end