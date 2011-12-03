class SearchController < ApplicationController
  def search
    @term = params[:query]
    @station = Station.find_by_name(params[:near])
    @businesses = Search.new(:term => @term, :station => @station).fetch_results
  end
end
