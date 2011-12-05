class SearchController < ApplicationController
  # This method is sort of a cluster...
  def index
    @term, @station = params[:query], Station.find_by_name(params[:near])
    if @term.nil? || @station.nil?
      @title = "Search"
      if params[:near]
        flash[:error] = I18n.t('error_prefix.html').html_safe
        flash[:error] << I18n.t('errors.unknown_station', :station => params[:near])
      end
    else
      @search = Search.new(:term => @term, :station => @station)
      @businesses = @search.fetch_results
      @title = "'#{@term}' near #{@station.name}"
      render 'results'
    end
  end
end
