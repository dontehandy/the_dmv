require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :age,
              :electric_vehicle,
              :plate_type
  attr_accessor :registration_fee

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @electric_vehicle = vehicle_details[:electric_vehicle] || false
    @plate_type = :regular
    @registration_fee = 0
  end

  def antique?
    @year < 1990
  end

  def electric_vehicle?
    @engine == :ev || @engine == :electric
  end
end
