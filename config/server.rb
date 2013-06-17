# server.rb
# @author naoiwata

require 'webrick'

server = WEBrick::HTTPServer.new({
	:DocumentRoot  => "./", 
	:Port => 8080, 
	:NondisclosureName => [ "*.", ".git"] 
})

['INT', 'TERM'].each {
	|signal| Signal.trap(signal){ server.shutdown 
}}

# init
server.start

# END