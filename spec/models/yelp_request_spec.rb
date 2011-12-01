require 'spec_helper'

describe YelpRequest do
  before(:each) do
    @dummy = YelpRequest.new("pizza", 0.0, 0.0, 5, 1000)
  end

  it "should have a consumer key" do
    @dummy.consumer_key.should_not be_nil
  end

  it "should have a consumer secret" do
    @dummy.consumer_secret.should_not be_nil
  end

  it "should have a token" do
    @dummy.token.should_not be_nil
  end

  it "should have a token secret" do
    @dummy.token_secret.should_not be_nil
  end

  describe "successful request" do
    use_vcr_cassette "pizza_union_station", :record => :new_episodes

    before(:each) do
      union = Factory(:station)
      @req = YelpRequest.new("pizza", union.latitude, union.longitude, 5, 1000)
    end

    it "fetches businesses" do
      @req.fetch_raw_data.should include('businesses')
    end
  end
end