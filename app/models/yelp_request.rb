require 'rubygems'
require 'oauth'

class YelpRequest
  attr_accessor :consumer_key, :consumer_secret, :token, :token_secret, :api_host

  def initialize(term, latitude, longitude, limit, radius)
    @term = term
    @ll = "#{latitude},#{longitude}"
    @limit = limit
    @radius = radius

    @consumer_key = ENV['YELP_OAUTH_CONSUMER_KEY']
    @consumer_secret = ENV['YELP_OAUTH_CONSUMER_SECRET']
    @token = ENV['YELP_OAUTH_TOKEN']
    @token_secret = ENV['YELP_OAUTH_TOKEN_SECRET']
    @api_host = 'api.yelp.com'
  end

  def fetch_raw_data
    consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret, {:site => "http://#{@api_host}"})
    access_token = OAuth::AccessToken.new(consumer, @token, @token_secret)

    path = "/v2/search?term=#{@term}&ll=#{@ll}&limit=#{@limit}&sort=0&radius_filter=#{@radius}"
    access_token.get(path).body
  end
end