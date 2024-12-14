# FILE: it2_rfeds_ip.rb
# Load required files
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

# Initialize the VehicleFactory
factory = VehicleFactory.new

# Fetch WA EV registrations
wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# Create vehicles from WA EV registrations
vehicles = factory.create_vehicles(wa_ev_registrations)

# pry - load 'it2_rfeds_ip.rb'
