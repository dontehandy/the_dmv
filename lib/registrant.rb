class Registrant #builds a class named Registrant
  attr_accessor :name, :age, :permit, :license_data
  #attr_accessor will make the instance variables name, age, permit, and license_data readable and writable
  #under the hood it creates a getter and setter method for each instance variable

  def initialize(name, age, permit = false) #initialize method with 3 parameters
    #initialize is a special method that is called when an object is created "my_object = MyClass.new"
    #parameters are placeholders for the values that will be passed in when the object is created
    #this particular set has a default value of false for permit "permit = false"
    @name = name #instance variable name is assigned the value of the name parameter
    @age = age
    @permit = permit
    @license_data = { written: false, license: false, renewed: false }
    #hash with keys written, license, and renewed
    #all values are false
    #hash is a collection of key-value pairs
    #the value of the key is false
    #false by default
    #will be passed in when the object is created
  end

  def permit?
    @permit
  end

  def earn_permit #method to change the permit status to true
    @permit = true #changes the permit status to true
  end
end

#basic class before reading IP requirements and adding more methods