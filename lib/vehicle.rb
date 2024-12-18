# filepath: /Users/dontehandy/turing_work/1mod/projects/the_dmv/lib/vehicle.rb
require 'date'
require 'pry'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine #used to make the instance variables accessible outside the class
  attr_accessor :plate_type, :registration_date #used to make the instance variables accessible outside the class and to change the value of the instance variable

  def initialize(details)
    @vin = details[:vin]
    #@vin is the instance variable
    # = is the assignment operator
    #details is the argument
    #[:vin] is the key
    @year = details[:year]
    @make = details[:make]
    @model = details[:model]
    @engine = details[:engine]
    @registration_date = nil
    @plate_type = :regular #being read by the facility class to determine the fee, default = reg
  end

  def age 
    current_year = Time.now.year #Time.now.year is a method that returns the current year
    current_year - @year #this is the age of the vehicle
  end

  def antique?
    age >= 25
  end

  def electric_vehicle?
    @engine == :ev || @engine == :electric #|| is a logical OR operator, if the left side is false, it will return the right side
  end

  def self.create_vehicles_from_data(data)
    data.map do |vehicle_data|
      Vehicle.new({
        vin: vehicle_data[:vin], 
        #vin is the key,
        #vehicle_data is the value
        #[:vin] is the value of the key 
        year: vehicle_data[:year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: vehicle_data[:engine]
      })
    end
  end
end
