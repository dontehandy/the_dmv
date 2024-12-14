class Facility # class for facility
  attr_reader :name, :address, :phone, :services #reader makes the instance variables accessible outside the class
                                                 #under the hood, just like a method that returns the value of the instance variable
  def initialize(facility)  
    @name = facility [:name] #@name is an instance variable, facility is a hash,  [:name is a symbol] is the key to the value of the name key 
    @address = facility [:address] #@address is an instance variable, facility is a hash,  [:address] is the key to the value of the address key
    @phone = facility [:phone] #@phone is an instance variable, facility is a hash,  [:phone] is the key to the value of the phone key
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return unless @services.include?('Register a vehicle')

    if vehicle.age >= 25
      vehicle.plate_type = :antique
      vehicle.registration_fee = 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      vehicle.registration_fee = 200
    else
      vehicle.plate_type = :regular
      vehicle.registration_fee = 100
    end
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Administer a written test')
    return false unless registrant.permit? && registrant.age >= 16

    registrant.pass_written_test
    true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Administer a road test')
    return false unless registrant.passed_written_test?

    registrant.pass_road_test
    true
  end

  def renew_license(registrant)
    return false unless @services.include?('Renew a driver’s license')
    return false unless registrant.licensed?

    registrant.renew_license
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