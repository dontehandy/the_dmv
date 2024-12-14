require 'spec_helper'
require './lib/vehicle'
require 'rspec'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      expect(@camaro.antique?).to eq(true)
      old_vehicle = Vehicle.new({ vin: '987654321zyxwvuts', year: 1980, make: 'Ford', model: 'Model T', engine: :ice })
      expect(old_vehicle.antique?).to be true
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
      ev_vehicle = Vehicle.new({ vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :electric })
      expect(ev_vehicle.electric_vehicle?).to be true
    end
  end

  describe '.create_vehicles_from_data' do
    it 'creates Vehicle objects from the data set' do
      wa_ev_registrations = [
        { vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev },
        { vin: '987654321zyxwvuts', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev }
      ]
      vehicles = Vehicle.create_vehicles_from_data(wa_ev_registrations)
      expect(vehicles).to all(be_an_instance_of(Vehicle))
      expect(vehicles.first.engine).to eq(:ev)
    end
  end
end
