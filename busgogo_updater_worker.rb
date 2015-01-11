require 'json'
require 'httparty'

# API_BASE_URI = 'http://localhost:9292'
API_BASE_URI = 'https://busgogo-dynamo.herokuapp.com'
API_VER = '/api/v1/'

def api_url(resource)
  URI.join(API_BASE_URI, API_VER, resource).to_s
end

puts "Worker started"
puts "My task_id is #{@iron_task_id}"
puts "Parameters: '#{params}'"

saved_bus = HTTParty.get api_url("buaupdate")
saved_bus.each do |bus|
  bus_url = api_url("nbaupdater/#{bus['id']}")
  results = HTTParty.get bus_url
  puts "Updated: #{bus['id']}"
end