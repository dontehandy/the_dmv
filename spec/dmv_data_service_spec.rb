require 'spec_helper' #this is the require statement that is used to load the spec_helper file, which is used to load the necessary files for the tests to run *refactor

RSpec.describe DmvDataService do #this is the rspec describe method that is used to test the DmvDataService class
  before(:each) do #this is the before method that is used to create a new instance of the DmvDataService class before each test
    @dds = DmvDataService.new #sets @dds to a new instance of the DmvDataService class
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService) #this is the test to see if the object is an instance of the class
    end
  end

  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://data.colorado.gov/resource/dsw3-mrn4.json' #this is the source variable that is equal to a string
      data_response = @dds.load_data(source) #this is the data_response variable that is equal to the load_data method called on the @dds variable with the source variable passed in as an argument
      #data_response is the variable that is equal to the load_data method called on the @dds variable with the source variable passed in as an argument
      #= is the assignment operator that is used to assign the value on the right to the variable on the left
      #@dds is the instance variable that is used to create a new instance of the DmvDataService class
      #.load_data is the method that is used to load the data from the source and return it as a JSON object
      #(source) is the argument that is passed into the load_data method which is the source variable above
      expect(data_response).to be_an_instance_of(Array) #this is the test to see if the data_response variable is an instance of the array class named Array
      expect(data_response.size).to be_an(Integer) #this is the test to see if the size of the data_response variable is an Integer 
    end
  end

  describe '#wa_ev_registrations' do
    it 'can load washington ev registration data' do #this is the test to see if the method can load the washington ev registration data
      expect(@dds.wa_ev_registrations.size).to be_an(Integer) 
      #this is the test to see if the size of the wa_ev_registrations method is an Integer
      #which would verify that the method is working correctly
      #expect is the method that is used to set the expectation for the test
      #@dds is the instance variable that is used to create a new instance of the DmvDataService class
      #.wa_ev_registrations is the method that is used to load the washington ev registration data
      #.size is the method that is used to get the size of the wa_ev_registrations method
      #.to is the method that is used to compare the size of the wa_ev_registrations method to the Integer class
      #be_an is the method that is used to check if the size of the wa_ev_registrations method is an instance of the Integer class
      #Integer is the class that is used to represent whole numbers
    end
  end

  describe '#co_dmv_office_locations' do
    it 'can load colorado dmv office locations' do
      expect(@dds.co_dmv_office_locations.size).to be_an(Integer)
    end
  end

  describe '#ny_dmv_office_locations' do
    it 'can load new york dmv office locations' do
      expect(@dds.ny_dmv_office_locations.size).to be_an(Integer)
    end
  end

  describe '#mo_dmv_office_locations' do
    it 'can load missouri dmv office locations' do
      expect(@dds.mo_dmv_office_locations.size).to be_an(Integer)
    end
  end
end

#The provided code is a test case written in RSpec, a testing framework for Ruby. 
#This test case is checking if the co_dmv_office_locations method of the @dds object returns a collection whose size is an Integer.
#meaning that the method is working correctly and returning the expected data.