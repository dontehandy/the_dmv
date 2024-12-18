# FILE: spec/vehicle_factory_spec.rb
require './lib/vehicle_factory'
require './lib/vehicle'
require 'rspec'

RSpec.describe VehicleFactory do
  describe '#create_vehicles' do #method to create vehicles from the data
    it 'creates Vehicle objects from the data set' do
      wa_ev_registrations = 
        { vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev },
        { vin: '987654321zyxwvuts', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev }
      ]
      factory = VehicleFactory.new
      vehicles = factory.create_vehicles(wa_ev_registrations)
      expect(vehicles).to all(be_an_instance_of(Vehicle))
      #expect(vehicles) is the object being tested
      #.to is the matcher
      #all is the method to check if all elements in the array are the same
      #be_an_instance_of(Vehicle) is the expected result
      expect(vehicles.first.engine).to eq(:ev)
      #expect(vehicles.first.engine) is the object being tested
      #.to is the matcher
      #eq(:ev) is the expected result
      #vehicles.first is the first element in the array
      #.engine is the engine of the vehicle
      #.to eq(:ev) is the expected result
    end
  end
end