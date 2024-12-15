require 'faraday' #faraday is a gem that allows you to make http requests
require 'json' #json is a class in the ruby standard library

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