class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers


  def self.eighteen_and_older
    where('age >= ?', 18)
  end
end

