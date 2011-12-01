require 'spec_helper'

describe Business do
  before(:each) do
    @attr = {
      :name => "Moe's Tavern",
      :phone => "(555) 764-8437",
      :display_address => ["555 Fake St.", "Springfield, XX 69420"],
      :rating_image_url => "http://static.yelp.com/foo/FIVESTARS.png",
      :yelp_url => "http://yelp.com/biz/moes-tavern-springfield",
      :review_count => 57,
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

  it "should require a rating image URL" do
    norating = Business.new(@attr.merge(:rating_image_url => ""))
    norating.should_not be_valid
  end

  it "should require a Yelp URL" do
    nourl = Business.new(@attr.merge(:yelp_url => ""))
    nourl.should_not be_valid
  end

  it "should require a review count" do
    noreviews = Business.new(@attr.merge(:review_count => nil))
    noreviews.should_not be_valid
  end

  it "should be valid given valid attributes" do
    moes = Business.new(@attr)
    moes.should be_valid
  end

  it "should convert distance to miles" do
    moes = Business.new(@attr.merge(:distance => 500))
    moes.distance_in_miles.should be_within(0.01).of(0.31)
  end

  it "should convert distance to kilometers" do
    moes = Business.new(@attr.merge(:distance => 500))
    moes.distance_in_km.should == 0.5
  end
end