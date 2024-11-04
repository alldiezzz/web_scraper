require 'httparty'
require 'json'
require 'csv'
require 'pry'
require_relative 'lib/scraper_utils.rb'  # Adjust the path as necessary

if ARGV.empty?
  puts "Usage: ruby scraper.rb <URL>"
  exit
end

url = ARGV[0]
output_file = ARGV[2] || "output.csv"
response = HTTParty.get(url)

if response.code == 200
  data = JSON.parse(response.body)
  specific_keys = ARGV[1] ? ARGV[1].split(',') : data.first.keys
  CSV.open(output_file, "w") do |csv|
    csv << specific_keys
    if data.is_a?(Array) && data.any?
      data.each do |entry|
        row_data = []
        if specific_keys.empty?
          row_data << entry.values
        else
          specific_keys.each do |key|
            row_data << fetch_nested_value(entry, key)
          end
        end
        csv << row_data.flatten
      end
      puts "Data saved to #{output_file}"
    else
      puts "No data found or data format is different than expected."
    end
  end
else
  puts "Failed to retrieve data. HTTP Status: #{response.code}"
end
