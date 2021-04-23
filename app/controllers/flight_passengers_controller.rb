class FlightPassengersController < ApplicationController
  def destroy
    # passenger = Passenger.find(params[:passenger_id])
    # passenger.flights.destroy(params[:flight_id])
    # redirect_to '/flights'
  FlightPassengers.where(passenger_id: params[:passenger], flight_id: params[:flight]).destroy_all
  end
end