# filepath: /Users/dontehandy/turing_work/1mod/projects/the_dmv/lib/vehicle.rb
require 'date'
require 'pry'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine #used to make the instance variables accessible outside the class
  attr_accessor :plate_type, :registration_date #used to make the instance variables accessible outside the class and to change the value of the instance variable

  def initialize(details)
    @vin = details[:vin]
    @year = details[:year]
    @make = details[:make]
    @model = details[:model]
    @engine = details[:engine]
    @registration_date = nil
    @plate_type = :regular #being read by the facility class to determine the fee, default = reg
  end

  def age 
    current_year = Time.now.year
    current_year - @year
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
        year: vehicle_data[:year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: vehicle_data[:engine]
      })
    end
  end
end
