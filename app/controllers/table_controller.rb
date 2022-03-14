class TableController < ApplicationController
  def index
    @elements = Element.includes(:category)
  end

  def show 
    @element = Element.find(params[:id])
  end
end
