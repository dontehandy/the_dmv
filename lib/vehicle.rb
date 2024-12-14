# filepath: /Users/dontehandy/turing_work/1mod/projects/the_dmv/lib/vehicle.rb
require 'date'
require 'pry'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine
  attr_accessor :plate_type, :registration_date

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
    @engine == :ev || @engine == :electric
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
