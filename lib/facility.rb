require 'date'
require 'pry'
require_relative 'dmv_data_service'

class Facility
  attr_accessor :name, :address, :phone, :services
  attr_reader :registered_vehicles, :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = details[:services] || []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return unless @services.include?('Vehicle Registration')

    if vehicle.age >= 25
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end

    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test') && registrant.age >= 16 && registrant.permit?
    registrant.license_data[:written] = true
    true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') && registrant.license_data[:written]
    registrant.license_data[:license] = true
    true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License') && registrant.license_data[:license]
    registrant.license_data[:renewed] = true
    true
  end

  def self.create_from_data(data, state)
    data.map do |facility_data|
      case state
      when :co
        new(
          name: facility_data[:dmv_office],
          address: "#{facility_data[:address_li]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip]}",
          phone: facility_data[:phone],
          services: facility_data[:services_p] || []
        )
      when :ny
        new(
          name: facility_data[:office_name],
          address: "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip_code]}",
          phone: facility_data[:public_phone_number],
          services: facility_data[:services] || []
        )
      when :mo
        new(
          name: facility_data[:name],
          address: "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zipcode]}",
          phone: facility_data[:phone],
          services: facility_data[:services] || []
        )
      else
        raise "Unsupported state: #{state}"
      end
    end
  end
end