class LinesController < ApplicationController
  autocomplete :station, :name

  def index
    @lines = Line.all
    @title = "Los Angeles Metro Rail Lines"
  end

  def show
    @line = Line.find(params[:id])
    @title = @line.name
  end
end
