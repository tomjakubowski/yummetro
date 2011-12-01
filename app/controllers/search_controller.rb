class SearchController < ApplicationController
  def search
    @term = params[:query]
    @station = Station.find_by_name(params[:near])
    @businesses = Search.new(:term => @term, :station => @station).fetch_results
    # @businesses = Array.new(12) do
    #   Business.new :name => "#{Faker::Company.name} #{Faker::Company.suffix}",
    #                :distance => rand * 1000,
    #                :display_address => [Faker::Address.street_address,
    #                                     ["Chinatown", "Downtown", "Uptown", "Wee Britain"].sample,
    #                                     "#{Faker::Address.city}, #{Faker::Address.state_abbr}"],
    #                :review_count => rand(2000),
    #                :rating_image_url => "http://media2.ak.yelpcdn.com/static/201012164084228337/img/ico/stars/stars_#{(1..5).to_a.sample}.png",
    #                :yelp_url => "http://yelp.com/biz/yelp-san-francisco",
    #                :phone => Faker::PhoneNumber.phone_number
    # end
  end
end
