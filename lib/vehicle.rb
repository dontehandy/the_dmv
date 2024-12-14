require 'date'
require 'pry'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine
  attr_accessor :plate_type, :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = :regular
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
end
