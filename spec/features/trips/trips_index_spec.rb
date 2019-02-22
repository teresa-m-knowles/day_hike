require 'rails_helper'

RSpec.describe 'Visitor can see all trips' do
  before :each do
    @trip_1 = Trip.create(name: "Trip One", start_date: "2009-07-07", end_date: "2009-08-07")
    @trip_2 = Trip.create(name: "Trip Two", start_date: "2009-07-07", end_date: "2009-07-09")
    @trip_3 = Trip.create(name: "Trip Three", start_date: "2009-07-07", end_date: "2009-07-08")

  end
  it 'I can see all trips in trips index page' do
    visit trips_path

    expect(page).to have_content(@trip_1.name)
    expect(page).to have_content(@trip_2.name)
    expect(page).to have_content(@trip_3.name)
  end

  it 'the trip names are links to that trip show page' do
    visit trips_path

    expect(page).to have_link(@trip_1.name)
    expect(page).to have_link(@trip_2.name)
    expect(page).to have_link(@trip_3.name)

    click_link @trip_1.name

    expect(current_path).to eq(trip_path(@trip_1))
  end
end
