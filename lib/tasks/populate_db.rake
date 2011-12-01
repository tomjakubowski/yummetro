require 'psych'

namespace :db do
  desc "Fill database with Google Transit and handmade data."
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_stations
    make_lines_and_stops
  end
end

def make_stations
  stops_file = File.join(File.dirname(__FILE__), "data/rail_stops.txt")

  puts "Reading stops data from #{stops_file}"

  station_hashes = Array.new

  File.open(stops_file).each_line do |l|
    tokens = l.split(',')
    stop_name, stop_lat, stop_lon = tokens[2], tokens[4].to_f, tokens[5].strip.to_f
    station_hashes.push({:name => stop_name, :latitude => stop_lat, :longitude => stop_lon}) if station_hashes.select { |h| h[:name] == stop_name}.empty?
  end

  station_hashes.each do |s|
    station = Station.create!(s)
    if station
      puts "Added station: #{station.name}"
    else
      puts "Could not add station: #{station.name}"
    end
  end
end

def make_lines_and_stops
  lines_file = File.join(File.dirname(__FILE__), "data/lines.yml")

  puts "Reading lines data from #{lines_file}"

  lines = Psych.load(File.open(lines_file))

  lines.each do |l|
    line = Line.create!(:name => l['name'], :color => l['color'])
    unless line
      puts "Could not create line #{l['name']}."
      next
    end
    puts "Created line: #{line.name}"
    l['stops'].each do |stop|
      station = Station.find_by_name(stop)
      station ||= Station.find_by_name("#{stop} Station") # because I'm lazy!
      if station
        line.add_stop!(station)
        puts "  Added station stop: #{station.name}"
      else
        puts "  Could not add station stop: #{stop}"
      end
    end
  end
end