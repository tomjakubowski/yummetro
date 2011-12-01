class Search
  include ActiveModel::Validations

  validates_presence_of :term, :station

  attr_reader :term, :station, :limit, :radius

  def initialize(opts)
    opts = {:limit => 5, :radius => 1000}.merge(opts)
    @term, @station, @limit, @radius = opts[:term], opts[:station], opts[:limit], opts[:radius]
  end

  def fetch_results
    request = YelpRequest.new(@term, @station.latitude, @station.longitude, @limit, @radius)
    response = request.fetch_raw_data
    businesses = JSON.parse(response)['businesses']
    businesses.map do |b|
      Business.new :name => b['name'],
                   :distance => b['distance'],
                   :display_address => b['location']['display_address'],
                   :phone => b['phone']
    end
  end
end