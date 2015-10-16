require 'yahoo_weatherman'

puts "Please enter your location. You can enter in the following formats:"
puts "  City and state"
puts "  Zip code"
puts "  Airport code"
current_location = gets.chomp

client = Weatherman::Client.new

wf = client.lookup_by_location(current_location).forecasts

today = Time.now.strftime('%w').to_i

wf.each do |f|
  day = f['date'].strftime('%w').to_i

  case (day)
  when today
    day_description = "today"
  when today + 1
    day_description = "tomorrow"
  else
    day_description = f['day']
  end

  puts "Forecast for " + day_description + ': ' + f['text']
end
