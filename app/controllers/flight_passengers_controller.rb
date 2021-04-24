class FlightPassengersController < ApplicationController
  def destroy
    FlightPassenger.find_by(passenger_id: params[:passenger_id], flight_id: params[:id]).destroy
    redirect_to "/flights"
  end
end