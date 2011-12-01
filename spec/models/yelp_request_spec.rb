require 'spec_helper'

describe YelpRequest do
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