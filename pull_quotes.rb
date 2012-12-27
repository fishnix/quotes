
require 'rubygems'
require 'redis'
require 'yahoo_finance'
require 'simple-graphite'
require 'mixlib/config'

class QuotesConfig
  extend(Mixlib::Config)
  from_file('quotes_config.rb')
end

def getPrice(syms)
  YahooFinance::quotes(syms)
end

g = Graphite.new({ :host => QuotesConfig[:graphite_host], 
                   :port => QuotesConfig[:graphite_port]
                  })

getPrice(QuotesConfig[:symbols]).each do |s|
  #puts "#{s.symbol.tr('"', '')} #{s.last_trade_price}"
  metric = "#{QuotesConfig[:graphite_namespace]}.#{s.symbol.tr('"', '')} #{s.last_trade_price}"
  g.push_to_graphite do |socket|
    socket.puts "#{metric} #{g.time_now}"
  end
end