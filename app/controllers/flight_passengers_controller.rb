class FlightPassengersController < ApplicationController
  def destroy
    # passenger = Passenger.find(params[:passenger_id])
    # passenger.flights.destroy(params[:flight_id])
    # redirect_to '/flights'
    FlightPassenger.find_by(passenger_id: params[:passenger_id], flight_id: params[:id]).destroy
  end
end