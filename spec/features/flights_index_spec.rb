require 'rails_helper'

RSpec.describe "Flights Index Page" do
  before :each do
    @airline = Airline.create!(name: "Larsh Airlines")
    @flight_1 = Flight.create!(number: "1999", date: "07/16/21", departure_city: "Seattle", arrival_city: "Denver", airline: @airline)    
    @flight_2 = Flight.create!(number: "5454", date: "07/13/21", departure_city: "New York", arrival_city: "Los Angeles", airline: @airline)
    @passenger1 = Passenger.create!(name: "Stephen Tsimicalis", age: 28)
    @passenger2 = Passenger.create!(name: "Larsh Homestead", age: 33)
    @passenger3 = Passenger.create!(name: "Pierce Lamb", age: 20)
    @passenger4 = Passenger.create!(name: "David Lamb", age: 34)
    @passenger5 = Passenger.create!(name: "Kohl Miller", age: 65)

    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger1.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger2.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger3.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger4.id)

    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger4.id)
    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger5.id)
  end

  it "shows a list of flights with a list of passengers for each flight" do
  visit "/flights"


    expect(page).to have_content(@airline.name)
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@passenger1.name)
    expect(page).to have_content(@passenger2.name)
    expect(page).to have_content(@passenger3.name)
    expect(page).to have_content(@passenger4.name)
  
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@passenger4.name)
    expect(page).to have_content(@passenger5.name)
  end

  it "I Can Remove a Passenger from a Flight" do
  visit "/flights"

    within "#passenger-#{@passenger1.id}" do
      expect(page).to have_button("Remove Passenger")
    end

    within "#passenger-#{@passenger2.id}" do
      expect(page).to have_button("Remove Passenger")
    end

    within "#flight-#{@flight_1.id}" do
      within "#passenger-#{@passenger4.id}" do
        expect(page).to have_button("Remove Passenger")
        click_button "Remove Passenger"
      end
    end
  end
end 