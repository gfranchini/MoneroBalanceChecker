#!/usr/local/bin/ruby
require 'httparty'
require 'nokogiri'
require 'tty-spinner'

url = 'https://monerohash.com/api/stats_address?address=45f25xoWSUvPdvDXCQjmEv7ihEceXF6nsVeyNtbavtmFQPgoUAtnKpDgX5w4jHV9dLizRVXLEkuGwBnaTMjDFwq4NTwgkM4&longpoll=true'
stats =
puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
puts "\n"

#Creating spinner object.
spinner = TTY::Spinner.new("[:spinner] Gathering data ...", format: :classic)
#Looping until stats = true.
spinner.run('Done!') do
  stats = HTTParty.get(url)
end
#Setting variables.
balance = (stats['stats']['balance'].to_f)/1000000000000
hashrate=(stats['stats']['hashrate'])
#Getting current price of Monero by parsing worldcoinindex website.
price_stats = HTTParty.get('https://www.worldcoinindex.com/coin/monero')
dom = Nokogiri::HTML(price_stats.body)
price = dom.css('.coinprice')[0].text
price = price.gsub(/\r\n?/, "").delete(' ').tr('$','').to_f
pending_balance = price * balance
#Printing data to console.
puts "\nYour current Monero balance from monerohash.com is:\n
#{balance}\n
which equates to:\n
$#{pending_balance} USD today."
puts "\nAnd your current hashrate is #{hashrate}"
puts "\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
