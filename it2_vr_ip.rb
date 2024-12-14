# Load required files
require './lib/facility'
require './lib/vehicle'

#pry - load 'it2_vr_ip.rb'

# FILE: it2_vr_ip.rb

require './lib/facility'
#=> true

require './lib/vehicle'
#=> true

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
#=> #<Facility:0x000000010e5ad5e8 @address="2855 Tremont Place Suite 118 Denver CO 80205", @name="DMV Tremont Branch", @phone="(720) 865-4600", @services=[]>

facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
#=> #<Facility:0x000000010e5ad480 @address="4685 Peoria Street Suite 101 Denver CO 80239", @name="DMV Northeast Branch", @phone="(720) 865-4600", @services=[]>

cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
#=> #<Vehicle:0x0000000135a48b08 @engine=:ice, @make="Chevrolet", @model="Cruz", @plate_type=nil, @registration_date=nil, @vin="123456789abcdefgh", @year=2012>

bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
#=> #<Vehicle:0x0000000125832180 @engine=:ev, @make="Chevrolet", @model="Bolt", @plate_type=nil, @registration_date=nil, @vin="987654321abcdefgh", @year=2019>

camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
#=> #<Vehicle:0x0000000135adb610 @engine=:ice, @make="Chevrolet", @model="Camaro", @plate_type=nil, @registration_date=nil, @vin="1a2b3c4d5e6f", @year=1969>

facility_1.add_service('Vehicle Registration')
#=> ["Vehicle Registration"]

cruz.registration_date #checks the registration date of the cruz vehicle
#=> nil

facility_1.registered_vehicles #checks the registered vehicles in facility 1
#=> []

facility_1.collected_fees #checks the collected fees in facility 1
#=> 0

facility_1.register_vehicle(cruz) #registers the cruz vehicle in facility 1
#=> [#<Vehicle:0x0000000135a48b08...>]

cruz.registration_date #checks the registration date of the cruz vehicle
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

cruz.plate_type #checks the plate type of the cruz vehicle #series of if else statements to determine type and price of plate
#=> :regular

facility_1.registered_vehicles #checks the registered vehicles in facility 1
#=> [#<Vehicle:0x0000000135a48b08...>]

facility_1.collected_fees #checks the collected fees in facility 1
#=> 100

facility_1.register_vehicle(camaro) #registers the camaro vehicle in facility 1
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

camaro.registration_date #checks the registration date of the camaro vehicle
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

camaro.plate_type #checks the plate type of the camaro vehicle
#=> :antique

facility_1.register_vehicle(bolt) #registers the bolt vehicle in facility 1
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

bolt.registration_date #checks the registration date of the bolt vehicle
#=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

bolt.plate_type #checks the plate type of the bolt vehicle
#=> :ev

facility_1.registered_vehicles #checks the registered vehicles in facility 1
#=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

facility_1.collected_fees #checks the collected fees in facility 1
#=> 325

facility_2.registered_vehicles #checks the registered vehicles in facility 2
#=> []

facility_2.services #checks the services in facility 2
#=> []

facility_2.register_vehicle(bolt) #registers the bolt vehicle in facility 2
#=> nil

facility_2.registered_vehicles #checks the registered vehicles in facility 2
#=> []

facility_2.collected_fees #checks the collected fees in facility 2
#=> 0



