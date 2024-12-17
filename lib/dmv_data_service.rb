require 'faraday'
require 'json'
require 'pry'

#to run rspec for this class only: rspec spec/dmv_data_service_spec.rb

class DmvDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations #method called wa_ev_registrations that returns the data from the washington ev registration source
    @wa_ev_registrations ||= load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
    #this is the instance variable that is used to memoize the data from the washington ev registration source
    #||= is the memoization operator that is used to assign the value on the right to the variable on the left if the variable is nil
    #load_data is the method that is used to load the data from the washington ev registration source
    #('https://data.wa.gov/resource/rpr4-cgyd.json') is the argument that is passed into the load_data method which is the washington ev registration source
    #the data is returned as a JSON object
  end

  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data('https://data.colorado.gov/resource/dsw3-mrn4.json')
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data('https://data.ny.gov/resource/9upz-c7xg.json')
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data('https://data.mo.gov/resource/835g-7keg.json')
  end
end


#As detailed in the interaction pattern, you can access the data you need with the following code snippet.

#DmvDataService.new.wa_ev_registrations

#use as template for Handy Transport APP/ Dispatch idea.  Take Data from Routes -> populate in CF -> buy -> lean -> LS.automation with going rate from DATloadboard. 
#handy transport LTL idea for finding ltl in between and base on cubes. 30 minutes. one picture. 
#use as template....

#to access from pry to answer 

# How can we access data that is nested more deeply?

#1 require 'pry' - check on the top of the file ??
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


# _________________________________________________________

# to check in pry, run from lib folder
# require './dmv_data_service'  - -- #this will return true and it loads the file
# DmvDataService.new.co_dmv_office_locations
# DmvDataService.new.ny_dmv_office_locations
# DmvDataService.new.mo_dmv_office_locations
# the return will be the data from the colorado dmv office locations in a hash format

# => [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
#   :dmv_id=>"1",
#   :dmv_office=>"DMV Tremont Branch",
#   :address_li=>"2855 Tremont Place",
#   :address__1=>"Suite 118",
#   :city=>"Denver",
#   :state=>"CO",
#   :zip=>"80205",
#   :phone=>"(720) 865-4600",
#   :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
#   :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
#   :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
#   :photo=>"images/Tremont.jpg",
#   :address_id=>"175164",









