Quotes
======
  
Just a little app to fetch quotes from Yahoo Finanace and send them to graphite.  
  
  
Requirements:
------------

A running graphite server  
A running redis instance (eventually)  
  
### Gems:  

redis  
yahoo_finance  
simple-graphite  
mixlib/config  

Setup
-----
  
* cp -p quotes_config.rb.template quotes_config.rb
* edit quotes_config.rb
* ruby pull_quotes.rb