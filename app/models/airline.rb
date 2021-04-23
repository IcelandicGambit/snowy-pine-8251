class Airline < ApplicationRecord
  has_many :flights
  
  def adults
    passengers.
    distinct.
    where('age >= ?', 18)
  end
end
