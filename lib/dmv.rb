class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service) 
    #return a list of facilities that offer the service
    
    @facilities.select { |facility| facility.services.include?(service) }
    #select is a method that returns a new array containing all elements of the original array for which the block returns a true value
    #facility is the block variable
    #facility.services is the services instance variable of the facility object
    #include? is a method that returns true if the given object is present in the array
  end
end

