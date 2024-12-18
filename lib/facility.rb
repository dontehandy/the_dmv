require 'date'
require 'pry'
require_relative 'dmv_data_service'

class Facility
  attr_accessor :name, :address, :phone, :services #accessor method creates getter and setter methods for each attribute, #setter methods allow you to change the value of the attribute
  attr_reader :registered_vehicles, :collected_fees #reader method creates getter methods for each attribute #used to access the value of the attribute without changing it #abstraction
  

  def initialize(details) #initialize method with 1 parameter, details is a hash that contains the keys name, address, phone, and services *refactor
    @name = details[:name] 
    #@name is an instance variable that is set to the value of the name key in the details hash
    #= is the assignment operator
    #details is a hash that contains the keys name, address, phone, and services
    #[:name] is a symbol that is used to access the value of the name key in the details hash
    @address = details[:address]
    @phone = details[:phone]
    @services = details[:services] || []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service) #method to be able to shovel in a service to the services array
    @services << service 
  end

  def register_vehicle(vehicle) #method to register a vehicle #takes in a vehicle object as an argument
    return unless @services.include?('Vehicle Registration') #return unless the services array includes the string 'Vehicle Registration'

    if vehicle.age >= 25 #if the vehicle's age is greater than or equal to 25
      vehicle.plate_type = :antique #set the vehicle's plate_type to :antique
      @collected_fees += 25 #increment the collected_fees by 25
    elsif vehicle.electric_vehicle? #if the vehicle is an electric vehicle
      vehicle.plate_type = :ev #set the vehicle's plate_type to :ev
      @collected_fees += 200 #increment the collected_fees by 200
    else
      vehicle.plate_type = :regular #set the vehicle's plate_type to :regular
      @collected_fees += 100 #increment the collected_fees by 100
    end

    #the above is business logic to determine the plate_type and collected_fees based on the vehicle's age and whether it is an electric vehicle
    #using a series of conditional statements to determine the plate_type and collected_fees

    vehicle.registration_date = Date.today #set the vehicle's registration_date to the current date
    @registered_vehicles << vehicle #shovel in the vehicle object to the registered_vehicles array.
    #register_vehicles is an instance variable that is an array that stores vehicle objects
    #<< is the shovel operator
    #to add the vehicle object to the registered_vehicles array just like you would add an element to an array, example: [1, 2, 3] << 4

  end

  def administer_written_test(registrant) #method to administer the written test #takes in a registrant object as an argument
    return false unless @services.include?('Written Test') && registrant.age >= 16 && registrant.permit? 
    #return false unless the services array includes the string 'Written Test' and the registrant's age is greater than or equal to 16 and the registrant has a permit
    registrant.license_data[:written] = true
    #set the written key in the license_data hash to true
    true
  end

  def administer_road_test(registrant) #method to administer the road test #takes in a registrant object as an argument
    return false unless @services.include?('Road Test') && registrant.license_data[:written]
    #return false unless the services array includes the string 'Road Test' and the written key in the license_data hash is true
    registrant.license_data[:license] = true
    #set the license key in the license_data hash to true
    true
  end

  def renew_drivers_license(registrant) #method to renew a driver's license #takes in a registrant object as an argument
    return false unless @services.include?('Renew License') && registrant.license_data[:license]
    #return false unless the services array includes the string 'Renew License' and the license key in the license_data hash is true
    registrant.license_data[:renewed] = true
    #set the renewed key in the license_data hash to true
    true
  end

  #the above methods are business logic to administer the written test, road test, and renew a driver's license
  #using conditional statements to determine if the services are available and if the registrant meets the requirements
  #setting the keys in the license_data hash to true based on the services provided
  #returning true if the services are available and the requirements are met
  #returning false if the services are not available or the requirements are not met
  #using the include? method to check if the services array includes a specific string

  def self.create_from_data(data, state) #class method to create facility objects from data and state
    data.map do |facility_data| #iterate over the data array |facility_data| is the block variable and can be used as a placeholder for each element in the data array
      case state 
      #case statement with the state as the argument
      #a case statement is used to compare the argument with the when clauses
      when :co
      #when the state is :co
      #the when clause is used to compare the argument with the value following it
        new( #is shorthand for Facility.new, below is the hash that is passed as an argument to the new method, argument total per instance is 1 because it is a hash
          name: facility_data[:dmv_office], 
          #name key in the hash is set to the value of the dmv_office key in the facility_data hash
          #facility_data is a hash that contains the keys dmv_office, address_li, city, state, zip, phone, and services_p 
          #[:dmv_office] is a symbol that is used to access the value of the dmv_office key in the facility_data hash
          #information is populated from the data array in the dmv_data_service.rb file
          address: "#{facility_data[:address_li]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip]}",
          #address key in the hash is set to a string that contains the values of the address_li, city, state, and zip keys in the facility_data hash
          #the string is interpolated with the values of the address_li, city, state, and zip keys in the facility_data hash
          #the values are separated by commas and spaces
          #the values are accessed using the keys address_li, city, state, and zip in the facility_data hash
          phone: facility_data[:phone],
          #phone key in the hash is set to the value of the phone key in the facility_data hash
          #the value is accessed using the key phone in the facility_data hash
          #the value is a string that contains the phone number of the facility
          services: facility_data[:services_p] || []
          #services key in the hash is set to the value of the services_p key in the facility_data hash
          #facility_data is a hash that contains the keys dmv_office, address_li, city, state, zip, phone, and services_p
          #[:services_p] is a symbol that is used to access the value of the services_p key in the facility_data hash
          # || is the logical OR operator
          #if the value of the services_p key is nil or false, an empty array is assigned to the services key
          # [] is an empty array
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
        raise "Unsupported state: #{state}" #raise an error if the state is not supported
      end
    end
  end
end

#to access data using pry
# start from lib folder

