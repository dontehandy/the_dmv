require 'pry'
require_relative './lib/dmv_data_service'

#run pry from dmv directory - 
# This will return true and it loads the file
# => true
require './lib/dmv_data_service'
# => true
# copy and paste: load 'dmv_ds_ip.rb'

# Initialize the service
service = DmvDataService.new

begin
  # Fetch Colorado DMV office locations
  co_data = service.co_dmv_office_locations
  # Expected return:
  # => [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
  #      :dmv_id=>"1",
  #      :dmv_office=>"DMV Tremont Branch",
  #      :address_li=>"2855 Tremont Place",
  #      :address__1=>"Suite 118",
  #      :city=>"Denver",
  #      :state=>"CO",
  #      :zip=>"80205",
  #      :phone=>"(720) 865-4600",
  #      :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
  #      :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
  #      :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
  #      :photo=>"images/Tremont.jpg",
  #      :address_id=>"175164",
  #      :":@computed_region_nku6_53ud"=>"1444"},
  #     {:the_geom=>{:type=>"Point", :coordinates=>[-104.84839592880655, 39.78135984611333]},
  #      :dmv_id=>"2",
  #      :dmv_office=>"DMV Northeast Branch",
  #      :address_li=>"4685 Peoria Street",
  #      :address__1=>"Suite 101",
  #      :location=>"Arie P. Taylor  Municipal Bldg",
  #      :city=>"Denver",
  #      :state=>"CO",
  #      :zip=>"80239",
  #      :phone=>"(720) 865-4600",
  #      :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
  #      :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
  #      :parking_no=>"parking available in both the front and back of the bldg; also on Paris Street",
  #      :photo=>"images/Peoria.jpg",
  #      :address_id=>"11348",
  #      :":@computed_region_nku6_53ud"=>"1444"},
  #     ...]
  raise "Unexpected data format for Colorado DMV office locations" unless co_data.is_a?(Array) && co_data.first[:dmv_office]
rescue => e
  binding.pry
end

begin
  # Fetch New York DMV office locations
  ny_data = service.ny_dmv_office_locations
  # Expected return:
  # => [{:office_name=>"Albany",
  #      :street_address_line_1=>"224-260 South Pearl Street",
  #      :city=>"Albany",
  #      :state=>"NY",
  #      :zip_code=>"12202",
  #      :public_phone_number=>"518-486-9786",
  #      :services=>["Driver's License", "Vehicle Registration", "Title Services"]},
  #     {:office_name=>"Buffalo",
  #      :street_address_line_1=>"170 Pearl Street",
  #      :city=>"Buffalo",
  #      :state=>"NY",
  #      :zip_code=>"14203",
  #      :public_phone_number=>"716-858-7450",
  #      :services=>["Driver's License", "Vehicle Registration", "Title Services"]},
  #     ...]
  raise "Unexpected data format for New York DMV office locations" unless ny_data.is_a?(Array) && ny_data.first[:office_name]
rescue => e
  binding.pry
end

begin
  # Fetch Missouri DMV office locations
  mo_data = service.mo_dmv_office_locations
  # Expected return:
  # => [{:name=>"DMV Office 1",
  #      :address1=>"123 Main St",
  #      :city=>"Jefferson City",
  #      :state=>"MO",
  #      :zipcode=>"65101",
  #      :phone=>"573-555-1234",
  #      :services=>["Driver's License", "Vehicle Registration", "Title Services"]},
  #     {:name=>"DMV Office 2",
  #      :address1=>"456 Elm St",
  #      :city=>"Columbia",
  #      :state=>"MO",
  #      :zipcode=>"65201",
  #      :phone=>"573-555-5678",
  #      :services=>["Driver's License", "Vehicle Registration", "Title Services"]},
  #     ...]
  raise "Unexpected data format for Missouri DMV office locations" unless mo_data.is_a?(Array) && mo_data.first[:name]
rescue => e
  binding.pry
end

begin
  # Fetch Washington EV registrations
  wa_data = service.wa_ev_registrations
  # Expected return:
  # => [{:vin_1_10=>"1HGCM82633A",
  #      :model_year=>"2003",
  #      :make=>"HONDA",
  #      :model=>"ACCORD",
  #      :electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
  #      :range=>"100",
  #      :city=>"SEATTLE",
  #      :state=>"WA",
  #      :zip=>"98101"},
  #     ...]
  raise "Unexpected data format for Washington EV registrations" unless wa_data.is_a?(Array) && wa_data.first[:vin_1_10]
rescue => e
  binding.pry
end