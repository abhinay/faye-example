require 'rubygems'
require 'net/http'
require 'json'

uri = URI.parse('http://localhost:8000/')

request = [{
  "channel" => "/foo",
  "data" => "Hello thattommyhall"
}]

content = JSON.unparse(request)
head = {
  'Content-Type'    => 'application/json',
  'host'            => uri.host,
  'Content-Length'  => content.length.to_s
}

http = Net::HTTP.new(uri.host, uri.port)
http.open_timeout = 2
http.read_timeout = 2
http.request_post(uri.path, content, head)