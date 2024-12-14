# FILE: spec/vehicle_factory_spec.rb
require './lib/vehicle_factory'
require './lib/vehicle'
require 'rspec'

RSpec.describe VehicleFactory do
  describe '#create_vehicles' do
    it 'creates Vehicle objects from the data set' do
      wa_ev_registrations = [
        { vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev },
        { vin: '987654321zyxwvuts', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev }
      ]
      factory = VehicleFactory.new
      vehicles = factory.create_vehicles(wa_ev_registrations)
      expect(vehicles).to all(be_an_instance_of(Vehicle))
      expect(vehicles.first.engine).to eq(:ev)
    end
  end
end