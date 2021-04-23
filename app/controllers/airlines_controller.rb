class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = Airline.adults(@airline)
  end
end