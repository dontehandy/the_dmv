class Registrant #creating a class called Registrant
  attr_reader :name, :age, :permit, :license_data #with attributes of name, age, permit, and license_data
                                                  #the : indicates that the attribute is a symbol
                                                  #the attr_reader method creates a getter method for each attribute
                                                  #making the instance variables accessible outside the class
  def initialize(name, age, permit = false) #initialize method with 3 parameters, name, age, and permit
                                            #permit is set to false by default
    @name = name #instance variable @name is set to the value of the name parameter
    @age = age #instance variable @age is set to the value of the age parameter #data type is integer 
    @permit = permit #instance variable @permit is set to the value of the permit parameter
    @license_data = { written: false, license: false, renewed: false } #license_data is an instance variable a hash with 3 keys, written, license, and renewed
     #@instance-variable--assignment operator----{key: value, key: value, key: value}   
  end
  
  def earn_permit #method called earn_permit that sets the permit instance variable to true
    @permit = true #which is set to false by default in the initialize method #!change
  end

  def permit? #method called permit? that returns the value of the permit instance variable
    @permit #which is also set to false by default in the initialize method #check
  end
end