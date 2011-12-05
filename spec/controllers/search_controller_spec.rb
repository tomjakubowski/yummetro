require 'spec_helper'

describe SearchController do
  render_views

  describe "Successful station search" do
    use_vcr_cassette "pizza_union_station", :record => :new_episodes

    before(:each) do
      @station = Factory(:station)
      @term = "pizza"
      @params = {:query => @term, :near => @station.name}
    end

    it "should show the search term in the heading" do
      get :search, @params
      response.should have_selector("h1", :content => @term)
    end

    it "should show the station name in the heading" do
      get :search, @params
      response.should have_selector("h1", :content => @station.name)
    end

    it "should show the search results" do
      results = Search.new(:term => @term, :station => @station).fetch_results

      get :search, @params
      results.each do |r|
        response.should have_selector(".search-result", :content => r.name)
      end
    end

    describe "Yelp! credits" do
      it "should display the Powered by Yelp! image" do
        get :search, @params
        response.should have_selector(".api-credits img")
      end

      it "should have an alt text" do
        get :search, @params
        response.should have_selector(".api-credits img", :alt => "Powered by Yelp!")
      end

      it "should link to the Yelp! website" do
        get :search, @params
        response.should have_selector(".api-credits a", :href => "http://www.yelp.com/")
      end
    end
  end

  describe "Failed station search" do
    pending "tests go here"
  end

end
