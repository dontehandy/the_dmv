#this is an rspec test file for the registrant class

require 'rspec' # require the RSpec gem
require './lib/registrant' # require the file we are testing

RSpec.describe Registrant do #rspec describe method Registrant for class name as an argument
  before(:each) do
    @registrant = Registrant.new('Bruce', 18, true)
  end

  describe '#initialize' do #initialize method 
    it 'creates an instance of Registrant' do #creates a test for the initialize method"
      expect(@registrant).to be_an_instance_of(Registrant) #expects the registrant variable to be an instance of the Registrant class
    end

    it 'has a name' do #test for the name instance variable
      expect(@registrant.name).to eq('Bruce') #expects the name instance variable to be equal to the string 'Bruce'
    end

    it 'has an age' do
      expect(@registrant.age).to eq(18) #expects the age of the new instance, "Bruce" to be 18
    end

    it 'has a permit status' do
      expect(@registrant.permit?).to eq(true)
    end
  end
end
