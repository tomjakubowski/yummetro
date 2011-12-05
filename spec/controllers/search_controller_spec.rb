require 'spec_helper'

describe SearchController do
  render_views

  describe "Search page with no parameters" do
    it "should be a success" do
      get :index
      response.should be_success
    end

    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Search")
    end

    it "should display a search form" do
      get :index
      response.should have_selector("form#mainsearch")
    end
  end

  describe "Successful station search" do
    use_vcr_cassette "pizza_union_station", :record => :new_episodes

    before(:each) do
      @station = Factory(:station)
      @term = "pizza"
      @params = {:query => @term, :near => @station.name}
    end

    it "should show the search term in the heading" do
      get :index, @params
      response.should have_selector("h1", :content => @term)
    end

    it "should show the station name in the heading" do
      get :index, @params
      response.should have_selector("h1", :content => @station.name)
    end

    it "should show the search results" do
      results = Search.new(:term => @term, :station => @station).fetch_results

      get :index, @params
      results.each do |r|
        response.should have_selector(".search-result", :content => r.name)
      end
    end

    describe "Yelp! credits" do
      it "should display the Powered by Yelp! image" do
        get :index, @params
        response.should have_selector(".api-credits img")
      end

      it "should have an alt text" do
        get :index, @params
        response.should have_selector(".api-credits img", :alt => "Powered by Yelp!")
      end

      it "should link to the Yelp! website" do
        get :index, @params
        response.should have_selector(".api-credits a", :href => "http://www.yelp.com/")
      end
    end
  end

  describe "Failed station search" do
    before(:each) do
      @station_name = "Bunion Station"
      @term = "pizza"
      @params = {:query => @term, :near => @station_name}
    end

    it "should render the search form page" do
      get :index
      response.should render_template("search/index")
    end

    it "should show a flash error" do
      get :index, @params
      response.should have_selector(".alert-message.error")
    end

    it "should show the unknown station name in the flash" do
      get :index, @params
      response.should have_selector(".alert-message.error", :content => @station_name)
    end
  end

end
