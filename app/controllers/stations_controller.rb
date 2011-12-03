class StationsController < ApplicationController
  def index
    @stations = Station.all
    @title = "Los Angeles Metro Stations"
  end

  def show
    @station = Station.find(params[:id])
    @title = @station.name
  end
end
