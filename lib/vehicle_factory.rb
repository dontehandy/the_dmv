# FILE: lib/vehicle_factory.rb
require './lib/vehicle'

class VehicleFactory #creates the car catalog 
  def create_vehicles(data) #creates the vehicles from the data
    data.map do |vehicle_data| #iterates over the data
      Vehicle.new({ #creates a new instance of the Vehicle class
        vin: vehicle_data[:vin_1_10],
        #vin is the key,
        #vehicle_data is the value
        #[:vin_1_10] is the value of the key
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev
      })
    end
  end
end