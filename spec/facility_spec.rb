require './lib/facility'
require './lib/vehicle'
require 'rspec'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({ name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600', services: ['Vehicle Registration'] })
    @vehicle = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq(['Vehicle Registration'])
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'can register a vehicle and collect fees' do
      @facility.register_vehicle(@vehicle)
      expect(@facility.registered_vehicles).to include(@vehicle)
      expect(@facility.collected_fees).to eq(100)
    end
  end
end