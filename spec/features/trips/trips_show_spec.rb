require 'rails_helper'

RSpec.describe "Trip Show Page" do
  before :each do
    @trip = Trip.create(name: "Tested Trip", start_date: "2019-02-16", end_date: "2019-02-17")
    @trail_1 = @trip.trails.create!(length: 2, name:"Trail one", address:"Addres 1" )
    @trail_2 = @trip.trails.create!(length: 5, name:"Trail two", address:"Addres 2 st" )
    @trail_3 = @trip.trails.create!(length: 7, name:"Trail three", address:"Addres 3 st")
  end
  it 'I see a list of trails included in the trip, with their name, address and length' do

    visit trip_path(@trip)
    expect(page).to have_content(@trail_1.name)
    expect(page).to have_content(@trail_2.name)
    expect(page).to have_content(@trail_3.name)

    expect(page).to have_content(@trail_1.address)
    expect(page).to have_content(@trail_2.address)
    expect(page).to have_content(@trail_3.address)

    expect(page).to have_content(@trail_1.length)
    expect(page).to have_content(@trail_2.length)
    expect(page).to have_content(@trail_3.length)
  end

  it 'I see the total hiking distance' do
    visit trip_path(@trip)

    expect(page).to have_content("Total hiking distance: 14 miles")
  end

  it 'I see the total hiking distance' do
    visit trip_path(@trip)
    expect(page).to have_content("Average distance of its trails: 4.67 miles")
  end

  it 'I see the longest trail on trip' do
    visit trip_path(@trip)
    expect(page).to have_content("Longest Trail on Trip: #{@trail_3.name}")

  end

end
