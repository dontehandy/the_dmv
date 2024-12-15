require 'faraday' #faraday is a gem that allows you to make http requests
require 'json' #json is a class in the ruby standard library
require 'pry'

class DmvDataService
  def load_data(source) #method to load data from a source
    response = Faraday.get(source) #faraday.get is a method that makes a get request to the source
    JSON.parse(response.body, symbolize_names: true) #JSON.parse is a method that parses the response body into a hash
  end

  def wa_ev_registrations
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json') 
    #the ||= is a conditional assignment operator, it will only assign the value if the variable is nil or false
    #@wa_ev_registrations is an instance variable that holds the data from the source
  end

  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')
    #the ||= is a conditional assignment operator, it will only assign the value if the variable is nil or false
    #@co_dmv_office_locations is an instance variable that holds the data from the source
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
    #the ||= is a conditional assignment operator, it will only assign the value if the variable is nil or false
    #@ny_dmv_office_locations is an instance variable that holds the data from the source
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
    #the ||= is a conditional assignment operator, it will only assign the value if the variable is nil or false
    #@mo_dmv_office_locations is an instance variable that holds the data from the source
  end
end


#As detailed in the interaction pattern, you can access the data you need with the following code snippet.

#DmvDataService.new.wa_ev_registrations

#use as template for Handy Transport APP/ Dispatch idea.  Take Data from Routes -> populate in CF -> buy -> lean -> LS.automation with going rate from DATloadboard. 
#handy transport LTL idea for finding ltl in between and base on cubes. 30 minutes. one picture. 
#use as template....

#to access from pry to answer 

# How can we access data that is nested more deeply?

#1 require 'pry' - check on the top of the file
#2 require './lib/dmv_data_service' - to load the file, return should be true - q
#3 service = DmvDataService.new, data = service.wa_ev_registrations - q
#4 data.class - returns ARRAY #What is the datatype? 

#What information is here? 
#running with comma there is less information returned - 1 or 2 hybrid vehicles
#running individually there is more information returned - EVERYTHING THAT THE FILE HAS


# How can we access data that is nested more deeply?
#since its an array, we can access the first element by using some simple methods to look around
#data.first - returns the first element in the array
#data.count - returns the number of elements in the array which is 1000
#data.first.keys #returns an array of the keys in the first element of the array
#data.first[:fuel_type] #returns the value of the fuel_type key in the first element of the array
#data[0] #returns the first element in the array  #same as data.first q

#same as any other array, you can access the elements by their index






