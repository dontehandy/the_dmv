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
      expect(@cruz).to be_an_instance_of(Vehicle) #this is the test to see if the object is an instance of the class
      expect(@cruz.vin).to eq('123456789abcdefgh') #this is the test to see if the vin is equal to the value
      expect(@cruz.year).to eq(2012) #this is the test to see if the year is equal to the value
      expect(@cruz.make).to eq('Chevrolet') #this is the test to see if the make is equal to the value #string
      expect(@cruz.model).to eq('Cruz') #this is the test to see if the model is equal to the value #string #string
      expect(@cruz.engine).to eq(:ice) #this is the test to see if the engine is equal to the value #symbol
      expect(@cruz.registration_date).to eq(nil) #this is the test to see if the registration date is equal to the value #nil
    end
  end

  describe '#antique?' do #this is the test for the antique method
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false) #this is the test to see if the vehicle is an antique
      expect(@bolt.antique?).to eq(false) #this is the test to see if the vehicle is an antique
      expect(@camaro.antique?).to eq(true) #this is the test to see if the vehicle is an antique
      old_vehicle = Vehicle.new({ vin: '987654321zyxwvuts', year: 1980, make: 'Ford', model: 'Model T', engine: :ice })
      #old vehicle is a variable that is equal to a new instance of the Vehicle class with the following arguments passed in as a hash
      #meaning that the vin is equal to '987654321zyxwvuts', the year is equal to 1980, the make is equal to 'Ford', the model is equal to 'Model T', and the engine is equal to :ice
      #this information is stored in the old_vehicle variable and can be used to test the antique method

      expect(old_vehicle.antique?).to be true
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false) #this is the test to see if the vehicle is an electric vehicle
      expect(@bolt.electric_vehicle?).to eq(true) #this is the test to see if the vehicle is an electric vehicle
      expect(@camaro.electric_vehicle?).to eq(false) #this is the test to see if the vehicle is an electric vehicle
      ev_vehicle = Vehicle.new({ vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :electric })
      #ev_vehicle is a variable that is equal to a new instance of the Vehicle class with the following arguments passed in as a hash
      #meaning that the vin is equal to '123456789abcdefgh', the year is equal to 2020, the make is equal to 'Tesla', the model is equal to 'Model S', and the engine is equal to :electric
      #this information is stored in the ev_vehicle variable and can be used to test the electric_vehicle method
      #to access the vin of the ev_vehicle variable, you would use ev_vehicle.vin
      #to access the year of the ev_vehicle variable, you would use ev_vehicle.year
      expect(ev_vehicle.electric_vehicle?).to be true
    end
  end

  describe '.create_vehicles_from_data' do
    it 'creates Vehicle objects from the data set' do
      wa_ev_registrations = [
        { vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev },
        { vin: '987654321zyxwvuts', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev }
      ]

      #this is a nested array that contains hashes with the following keys and values
      #the first hash has the following keys and values: vin: '123456789abcdefgh', year: 2020, make: 'Tesla', model: 'Model S', engine: :ev
      #the second hash has the following keys and values: vin: '987654321zyxwvuts', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev
      #this information is stored in the wa_ev_registrations variable and can be used to test the create_vehicles_from_data method
      #to access vin of the first hash, you would use wa_ev_registrations[0][:vin]
      #to access model of the second hash, you would use wa_ev_registrations[1][:model]

      vehicles = Vehicle.create_vehicles_from_data(wa_ev_registrations)
      expect(vehicles).to all(be_an_instance_of(Vehicle))
      expect(vehicles.first.engine).to eq(:ev)
    end
  end
end
