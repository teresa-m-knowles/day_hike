require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :start_date}
    it {should validate_presence_of :end_date}
  end

  describe 'relationships' do
    it {should have_many :trail_trips}
    it { should have_many(:trails).through(:trail_trips)}
  end

  describe 'instance methods' do
    before :each do
      @trip = Trip.create(name: "Tested Trip", start_date: "2019-02-16", end_date: "2019-02-17")
      @trail_1 = @trip.trails.create!(length: 2, name:"Trail one", address:"Addres 1" )
      @trail_2 = @trip.trails.create!(length: 5, name:"Trail two", address:"Addres 2 st" )
      @trail_3 = @trip.trails.create!(length: 7, name:"Trail three", address:"Addres 3 st")
    end
    it '.total_hiking_distance' do
      expect(@trip.total_hiking_distance).to eq(14)

    end

    it '.average_miles' do

      expect(@trip.average_miles.to_f.round(2)).to eq(4.67)
    end

    it '.longest_trail' do
      expect(@trip.longest_trail).to eq(@trail_3)
    end




  end
end
