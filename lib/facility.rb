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

    @registered_vehicles << vehicle
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