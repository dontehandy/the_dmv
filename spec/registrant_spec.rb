#this is an rspec test file for the registrant class

require 'RSpec' # require the RSpec gem
require './lib/registrant' # require the file we are testing

RSpec.describe Registrant do #rspec describe method Registrant for class name as an argument
    describe '#initialize' do #initialize method 
        it 'creates an instance of Registrant' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant).to be_an_instance_of(Registrant)
        end

        it 'has a name' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant.name).to eq('Bruce')
        end

        it 'has an age' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant.age).to eq(18)
        end

        it 'has a permit status' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant.permit).to eq(true)
        end

        it 'has default license data' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant.license_data).to eq({ written: false, license: false, renewed: false })
        end
    end

    describe '#permit?' do
        it 'returns the permit status' do
            registrant = Registrant.new('Bruce', 18, true)
            expect(registrant.permit?).to eq(true)
        end
    end

    describe '#earn_permit' do
        it 'changes the permit status to true' do
            registrant = Registrant.new('Bruce', 18, false)
            registrant.earn_permit
            expect(registrant.permit).to eq(true)
        end
    end
end

#run with rspec spec/registrant_spec.rb