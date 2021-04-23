class Airline < ApplicationRecord
  has_many :flights
  
  def self.adults(airline)
    Passenger.joins(flights: :airline)
    .where('passengers.age >= ?', 18)
    .where("airlines.id = ?", airline.id)
    .distinct
  end
end
