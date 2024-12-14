# This will execute all commands in the it2_gadl_ip.rb file sequentially.
# By default, if any error occurs, the script will stop execution at that line, 
# and Pry will return to the REPL, allowing you to debug interactively.

require './lib/registrant'
require './lib/facility'

# pry - load 'it2_gadl_ip.rb'

require './lib/registrant'
#=> true

require './lib/facility'
#=> true

registrant_1 = Registrant.new('Bruce', 18, true )
#=> #<Registrant:0x000000012d863e80 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

registrant_2 = Registrant.new('Penny', 16 )
#=> #<Registrant:0x000000012d94ba78 @age=16, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

registrant_3 = Registrant.new('Tucker', 15 )
#=> #<Registrant:0x000000012d8b0e38 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Tucker", @permit=false>

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
#=> #<Facility:0x000000010e5ad5e8 @address="2855 Tremont Place Suite 118 Denver CO 80205", @name="DMV Tremont Branch", @phone="(720) 865-4600", @services=[]>

facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
#=> #<Facility:0x000000010e5ad480 @address="4685 Peoria Street Suite 101 Denver CO 80239", @name="DMV Northeast Branch", @phone="(720) 865-4600", @services=[]>

# Written Test

registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

registrant_1.permit?
#=> true

facility_1.administer_written_test(registrant_1)
#=> false

registrant_1.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

facility_1.add_service('Written Test')
#=> ["Written Test"]

facility_1.administer_written_test(registrant_1)
#=> true

registrant_1.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

registrant_2.age
#=> 16

registrant_2.permit?
#=> false

facility_1.administer_written_test(registrant_2)
#=> false

registrant_2.earn_permit

facility_1.administer_written_test(registrant_2)
#=> true

registrant_2.license_data
#=> {:written=>true, :license=>false, :renewed=>false}

registrant_3.age
#=> 15

registrant_3.permit?
#=> false

facility_1.administer_written_test(registrant_3)
#=> false

registrant_3.earn_permit

facility_1.administer_written_test(registrant_3)
#=> false

registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

# Road Test

facility_1.administer_road_test(registrant_3)
#=> false

registrant_3.earn_permit

facility_1.administer_road_test(registrant_3)
#=> false

registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

facility_1.administer_road_test(registrant_1)
#=> false

facility_1.add_service('Road Test')
#=> ["Written Test", "Road Test"]

facility_1.administer_road_test(registrant_1)
#=> true

registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

facility_1.administer_road_test(registrant_2)
#=> true

registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>false}

# Renew License

facility_1.renew_drivers_license(registrant_1)
#=> false

facility_1.add_service('Renew License')
#=> ["Written Test", "Road Test", "Renew License"]

facility_1.renew_drivers_license(registrant_1)
#=> true

registrant_1.license_data
#=> {:written=>true, :license=>true, :renewed=>true}

facility_1.renew_drivers_license(registrant_3)
#=> false

registrant_3.license_data
#=> {:written=>false, :license=>false, :renewed=>false}

facility_1.renew_drivers_license(registrant_2)
#=> true

registrant_2.license_data
#=> {:written=>true, :license=>true, :renewed=>true}



