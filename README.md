# The DMV

This is the starter repo for the BE Mod1 DMV project.

# rspec spec

iteration one IP
-------------------------------
require './lib/registrant'
#=> true

registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000015c10bed8 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

registrant_2 = Registrant.new('Penny', 15 )
#=> #<Registrant:0x000000015c0778c8 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

registrant_1.name
#=> "Bruce"

registrant_1.age
#=> 18

registrant_1.permit? --created a method and had to back out to reassign it from the default of a false to a true
#=> true

registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_2.name
#=> "Penny"

registrant_2.age
#=> 15

registrant_2.permit?
#=> false

registrant_2.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_2.earn_permit

*(no value returned; just a change in the permit status?/typo/nuking it?)*

#query methods and command methods are different
#query methods return a boolean and pull data
#command methods return a value and change data
true

registrant_2.permit?
#=> true
---------------------------------------