require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "yumMetro"
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should have the right title" do
      get 'index'
      response.should have_selector("title", :content => "#{@base_title} | Home")
    end

    it "should put the site name at the top level heading" do
      get 'index'
      response.should have_selector("h1", :content => "yumMetro")
    end

    it "should present a search form besides the topbar's" do
      get 'index'
      response.should have_selector("form#mainsearch")
    end

  end

end
