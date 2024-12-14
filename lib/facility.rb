class Facility # class for facility
  attr_reader :name, :address, :phone, :services #reader makes the instance variables accessible outside the class
                                                 #under the hood, just like a method that returns the value of the instance variable
  def initialize(facility)  
    @name = facility [:name] #@name is an instance variable, facility is a hash,  [:name is a symbol] is the key to the value of the name key 
    @address = facility [:address] #@address is an instance variable, facility is a hash,  [:address] is the key to the value of the address key
    @phone = facility [:phone] #@phone is an instance variable, facility is a hash,  [:phone] is the key to the value of the phone key
    @services = []

  def add_service(service)
    @services << service
  end
end
end

#think data

#instance variables are used to store data that is specific to an object.
#hash is a collection of key-value pairs
#hash = {key => value} or {key: value}
#to get the value of a key in a hash, you can use hash[:key]. 
#using it in the class 
#this is an example of a nested hash because the hash is inside the class