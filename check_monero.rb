#!/usr/local/bin/ruby
require 'httparty'
require 'tty-spinner'

url = 'https://monerohash.com/api/stats_address?address=45f25xoWSUvPdvDXCQjmEv7ihEceXF6nsVeyNtbavtmFQPgoUAtnKpDgX5w4jHV9dLizRVXLEkuGwBnaTMjDFwq4NTwgkM4&longpoll=true'
puts "Gathering data..."

stats = nil
spinner = TTY::Spinner.new("[:spinner] Loading ...", format: :pulse_2)

spinner.run('Done!') do
  stats = HTTParty.get('https://monerohash.com/api/stats_address?address=45f25xoWSUvPdvDXCQjmEv7ihEceXF6nsVeyNtbavtmFQPgoUAtnKpDgX5w4jHV9dLizRVXLEkuGwBnaTMjDFwq4NTwgkM4&longpoll=true')
end

balance = (stats['stats']['balance'].to_f)/1000000000000
hashrate=(stats['stats']['hashrate'])
puts "Your current Monero balance from moneropool.com is: #{balance}"
puts "And your current hashrate is #{hashrate}"
