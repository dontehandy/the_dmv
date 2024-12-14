#tdd stands for test driven design
#read interaction pattern, write test, run test, write code, run test, refactor code, run test - vicious cycle. #DEVOPS/#AGILE

#this is an rspec test file for the registrant class
#rspec is a gem that is used to test ruby code

require 'rspec' # require the Rspec gem
require './lib/registrant' # require the file we are testing

RSpec.describe Registrant do #rspec describe method Registrant for class name as an argument. #RSpec -capitalized
  before(:each) do
    @registrant = Registrant.new('Bruce', 18, true) #this is considered the set up
  end

  describe '#initialize' do #initialize method 
    it 'creates an instance of Registrant' do #creates a test for the initialize method"
      expect(@registrant).to be_an_instance_of(Registrant) #expects the registrant variable to be an instance of the Registrant class
    end

    it 'has a name' do #test for the name instance variable
      expect(@registrant.name).to eq('Bruce') #expects the name instance variable to be equal to the string 'Bruce'
    end

    it 'has an age' do
      expect(@registrant.age).to eq(18) #expects the age of the new instance, "Bruce/Penny" to be 18 (passed as an argument)
    end

    it 'has a permit status' do #test for the permit instance variable
      expect(@registrant.permit?).to eq(true) #expects the permit status of the new instance, "Bruce" to be true 
                                              #the execute part of the test is [expect](registrant.permit?) which is used to test the result of the test
                                              #the assert part of the test is [to eq(true)] which expects the result of the test to be true
    end
  end
end


#SEAT
#Set Up - before each test, create a new instance of the Registrant class and assign it to the instance variable @registrant
#Execute - expect method, which is used to test the result of the test. example: expect(@registrant) to be an instance of the Registrant class
#Assert - expect the result of the test to be true or false. example: expect(@registrant) to be an instance of the Registrant class
#Teardown - no teardown needed for this test

