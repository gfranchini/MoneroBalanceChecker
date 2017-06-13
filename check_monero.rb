#!/usr/local/bin/ruby
require 'httparty'
require 'tty-spinner'
require 'nokogiri'

url = 'https://monerohash.com/api/stats_address?address=45f25xoWSUvPdvDXCQjmEv7ihEceXF6nsVeyNtbavtmFQPgoUAtnKpDgX5w4jHV9dLizRVXLEkuGwBnaTMjDFwq4NTwgkM4&longpoll=true'
stats =
puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "\n"
spinner = TTY::Spinner.new("[:spinner] Gathering data ...", format: :classic)

spinner.run('Done!') do
  stats = HTTParty.get(url)
end

balance = (stats['stats']['balance'].to_f)/1000000000000
hashrate=(stats['stats']['hashrate'])
puts "\nYour current Monero balance from moneropool.com is: #{balance}"
puts "And your current hashrate is #{hashrate}"
puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
