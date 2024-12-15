require 'date' #date is a class in the ruby standard library
require 'pry' #pry is a gem that allows you to pause the execution of your program and interact with it in the terminal

#adding functionality to the Facility class

class Facility # class for facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees #reader makes the instance variables accessible outside the class
                                                 #under the hood, just like a method that returns the value of the instance variable
  def initialize(details)  
    @name = details[:name] #@name is an instance variable, details is a hash,  [:name is a symbol] is the key to the value of the name key 
    @address = details[:address] #@address is an instance variable, details is a hash,  [:address] is the key to the value of the address key
    @phone = details[:phone] #@phone is an instance variable, details is a hash,  [:phone] is the key to the value of the phone key
    @services = details[:services] || []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service) #method to add a service to the services array
    @services << service #array holds details[:services], [:services] is the key to the value of the services key
  end         
  
  # *refactor  #details is a hash, [:services] is the key to the value of the services key, meaning the value of the services key is an array
  # || is a logical OR operator, if the left side is false, it will return the right side
  # [] is an empty array, meaning if there is no value for the services key, the services array will be empty
  # to access the value of the services key, you would use details[:services]

  def register_vehicle(vehicle) #services to customer #method to a swe
    return unless @services.include?('Vehicle Registration') #will return nil if the services array does not include 'Vehicle Registration'

    #if else logic to determine the plate type and fees collected
    if vehicle.age >= 25 #must be 25 years or older to be considered an antique vehicle -defined in the vehicle class
      vehicle.plate_type = :antique #if older than 25, the plate type is set to :antique
      @collected_fees += 25 #is an instance variable that holds the total fees collected
    elsif vehicle.electric_vehicle? #if the vehicle is an electric vehicle
      vehicle.plate_type = :ev #the plate type is set to :ev  if the vehicle is an electric vehicle
      @collected_fees += 200 #is an instance variable that holds the total fees collected
    else 
      vehicle.plate_type = :regular #if the vehicle is not an antique or electric vehicle, the plate type is set to :regular
      @collected_fees += 100 #is an instance variable that holds the total fees collected
    end
    #plate_type is a method established in the vehicle class

    vehicle.registration_date = Date.today #will set the registration date to the current date - Date is a class in the ruby standard library
    @registered_vehicles << vehicle #and shovel the vehicle into the registered_vehicles array
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test') && registrant.age >= 16 && registrant.permit?
    #this will return false if the services array does not include 'Written Test' or if the registrant is under 16 or does not have a permit
    # && is used to combine multiple conditions, all conditions must be true for the statement to be true
    registrant.license_data[:written] = true #if the conditions are met, the written key in the license_data hash is set to true
    true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test') && registrant.license_data[:written]
    #this will return false if the services array does not include 'Road Test' or if the written key in the license_data hash is false
    registrant.license_data[:license] = true
    true
  end

  def renew_drivers_license(registrant)
    return false unless @services.include?('Renew License') && registrant.license_data[:license]
    #this will return false if the services array does not include 'Renew License' or if the license key in the license_data hash is false
    #meaning the registrant does not have a license or the license is expired
    registrant.license_data[:renewed] = true #renewed key in the license_data hash is set to true
    true
  end
end

#think data

#instance variables are used to store data that is specific to an object.
#hash is a collection of key-value pairs
#hash = {key => value} or {key: value}
#to get the value of a key in a hash, you can use hash[:key]. 
#using it in the class 
#this is an example of a nested hash because the hash is inside the class

#0824 - need to define the vehicle and registrant classes with the methods and attributes that are being called in the facility class