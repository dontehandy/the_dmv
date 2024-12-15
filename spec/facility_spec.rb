require './lib/facility'
require './lib/vehicle'
require './lib/registrant'
require 'rspec'
require 'date'
require 'pry'

RSpec.describe Facility do
  before(:each) do #using before(:each) to create a new instance of the Facility class and store it in the @facility variable
    @facility = Facility.new({ name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600', services: ['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License'] })
    @vehicle = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
    @registrant = Registrant.new('Bruce', 18, true)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq(['Vehicle Registration', 'Written Test', 'Road Test', 'Renew License'])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'can register a vehicle and collect fees' do
      @facility.register_vehicle(@vehicle)
      expect(@facility.registered_vehicles).to include(@vehicle)
      expect(@facility.collected_fees).to eq(100)
      expect(@vehicle.registration_date).to eq(Date.today)
    end
  end

  describe '#administer_written_test' do
    it 'can administer a written test' do
      expect(@facility.administer_written_test(@registrant)).to be true
      expect(@registrant.license_data[:written]).to be true
    end
  end

  describe '#administer_road_test' do
    it 'can administer a road test' do
      @facility.administer_written_test(@registrant)
      expect(@facility.administer_road_test(@registrant)).to be true
      expect(@registrant.license_data[:license]).to be true
    end
  end

  describe '#renew_drivers_license' do
    it 'can renew a driver\'s license' do
      @facility.administer_written_test(@registrant)
      @facility.administer_road_test(@registrant)
      expect(@facility.renew_drivers_license(@registrant)).to be true
      expect(@registrant.license_data[:renewed]).to be true
    end
  end
end