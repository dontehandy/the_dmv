# This will execute all commands in the it1_reg_ip file sequentially.
# By default, if any error occurs, the script will stop execution at that line, 
# and Pry will return to the REPL, allowing you to debug interactively.


# FILE: it1_reg_ip.rb
#pry ->  load 'it1_reg_ip.rb'

require './lib/registrant'
#=> true

registrant_1 = Registrant.new('Bruce', 18, true)
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

registrant_2 = Registrant.new('Penny', 15)
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

registrant_1.name
#=> "Bruce"

registrant_1.age
#=> 18

registrant_1.permit? #method for permit? 
#that checks if attribute permit from Registrant class is true.
#for registrant_1
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


