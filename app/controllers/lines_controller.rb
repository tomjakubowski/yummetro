class LinesController < ApplicationController
  autocomplete :station, :name

  def index
    @lines = Line.all
  end

  def show
    @line = Line.find(params[:id])
  end
end
