# This will execute all commands in the it1_reg_ip file sequentially.
# By default, if any error occurs, the script will stop execution at that line, 
# and Pry will return to the REPL, allowing you to debug interactively.

#navigate to the_dmv directory

#pry ->  load 'it1_reg_ip.rb'
#if true is the return, all test passed


require './lib/registrant'
#=> true

registrant_1 = Registrant.new('Bruce', 18, true)
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

registrant_2 = Registrant.new('Penny', 15)
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

#the above initializes two instances of the Registrant class, registrant_1 and registrant_2

registrant_1.name #method that will return the name attribute of the Registrant class
#=> "Bruce"

registrant_1.age #method that will return the age attribute of the Registrant class
#=> 18

registrant_1.permit? #method for permit? 
#that checks if attribute permit from Registrant class is true.
#for registrant_1 - was set to true during initialization 
#=> true

registrant_1.license_data #method that will return the key value pairs of @license data hash in Registrant class
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_2.name
#=> "Penny"

registrant_2.age
#=> 15

registrant_2.permit? #method for permit?
#that checks if attribute permit from Registrant class is true.
#for registrant_2
#=> false

registrant_2.license_data #method that will return the key value pairs of @license data hash in Registrant class
#=> {:written=>false, :license=>false, :renewed=>false} - using : makes it a symbol and not a string

registrant_2.earn_permit #is a an action method that will change the permit attribute to true from the Registrant class

registrant_2.permit? #is a predicate method that will check if the permit attribute is true
#=> true


#last two change the hash of data in the @license_data instance variable
#the method earn_permit changes the permit attribute to true
#asking directly after if the permit attribute is true will return true


#---series of checking for expected returns that may indicate that a function has been broken

