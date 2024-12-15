require './lib/facility' #we are requiring the facility class so that we can use it in the tests
require './lib/vehicle' #we are requiring the vehicle class so that we can use it in the tests
require './lib/registrant' #we are requiring the registrant class so that we can use it in the tests
require 'rspec'
require 'date' #we are requiring the date class so that we can use it in the tests
require 'pry' 

RSpec.describe Facility do
  before(:each) do #using before(:each) to create a new instance of the Facility class and store it in the @facility variable
    @facility = Facility.new({ name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600', services: ['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License'] })
    @vehicle = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
    @registrant = Registrant.new('Bruce', 18, true)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility) #checking if the @facility variable is an instance of the Facility class
      expect(@facility.name).to eq('DMV Tremont Branch') #checking if the name instance variable is equal to the string 'DMV Tremont Branch'
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205') #checking if the address instance variable is equal to the string '2855 Tremont Place Suite 118 Denver CO 80205'
      expect(@facility.phone).to eq('(720) 865-4600') #checking if the phone instance variable is equal to the string '(720) 865-4600'
      expect(@facility.services).to eq(['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License']) #checking if the services instance variable is equal to the array ['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License']
      expect(@facility.registered_vehicles).to eq([]) #checking if the registered_vehicles instance variable is equal to an empty array
      expect(@facility.collected_fees).to eq(0) #checking if the collected_fees instance variable is equal to 0
    end
  end

  describe '#register_vehicle' do
    it 'can register a vehicle and collect fees' do 
      @facility.register_vehicle(@vehicle) #calling the register_vehicle method on the @facility variable and passing in the @vehicle variable as an argument
      expect(@facility.registered_vehicles).to include(@vehicle) #checking if the registered_vehicles instance variable includes the @vehicle variable
      expect(@facility.collected_fees).to eq(100) #checking if the collected_fees instance variable is equal to 100
      expect(@vehicle.registration_date).to eq(Date.today) #checking if the registration_date instance variable of the @vehicle variable is equal to the current date
    end
  end

  describe '#administer_written_test' do
    it 'can administer a written test' do
      expect(@facility.administer_written_test(@registrant)).to be true #calling the administer_written_test method on the @facility variable and passing in the @registrant variable as an argument
      expect(@registrant.license_data[:written]).to be true #checking if the written key in the license_data hash of the @registrant variable is true
    end
  end

  describe '#administer_road_test' do
    it 'can administer a road test' do
      @facility.administer_written_test(@registrant) #calling the administer_written_test method on the @facility variable and passing in the @registrant variable as an argument
      expect(@facility.administer_road_test(@registrant)).to be true #calling the administer_road_test method on the @facility variable and passing in the @registrant variable as an argument
      expect(@registrant.license_data[:license]).to be true #checking if the license key in the license_data hash of the @registrant variable is true
    end
  end

  describe '#renew_drivers_license' do
    it 'can renew a driver\'s license' do
      @facility.administer_written_test(@registrant) #calling the administer_written_test method on the @facility variable and passing in the @registrant variable as an argument
      @facility.administer_road_test(@registrant) #calling the administer_road_test method on the @facility variable and passing in the @registrant variable as an argument
      expect(@facility.renew_drivers_license(@registrant)).to be true #calling the renew_drivers_license method on the @facility variable and passing in the @registrant variable as an argument
      expect(@registrant.license_data[:renewed]).to be true #checking if the renewed key in the license_data hash of the @registrant variable is true
    end
  end
end