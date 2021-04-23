require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }

  before :each do
    @airline = Airline.create!(name: "Larsh Airlines")
    @airline2 = Airline.create!(name: "Plamb Airlines")
    @flight_1 = Flight.create!(number: "1999", date: "07/16/21", departure_city: "Seattle", arrival_city: "Denver", airline: @airline)    
    @flight_2 = Flight.create!(number: "5454", date: "07/13/21", departure_city: "New York", arrival_city: "Los Angeles", airline: @airline)
    @passenger1 = Passenger.create!(name: "Stephen Tsimicalis", age: 28)
    @passenger2 = Passenger.create!(name: "Larsh Homestead", age: 33)
    @passenger3 = Passenger.create!(name: "Pierce Lamb", age: 20)
    @passenger4 = Passenger.create!(name: "David Lamb", age: 34)
    @passenger5 = Passenger.create!(name: "Kohl Miller", age: 8)

    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger1.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger2.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger3.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger4.id)

    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger4.id)
    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger5.id)
  end

  describe "instance methods" do
    describe "#adults" do
      it "displays passengers who are 18 or older" do
        expect(Airline.adults(@airline)).to eq([@passenger1, @passenger2, @passenger3, @passenger4])
        expect(Airline.adults(@airline)).not_to include(@passenger_2)
      end
    end
  end
end

