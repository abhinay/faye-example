var http = require('http'),
    faye = require('faye');

var bayeux = new faye.NodeAdapter({
  mount:    '/',
  timeout:  45
});

var server = http.createServer(function(request, response) {
  response.writeHead(200, {'Content-Type': 'text/plain'});
  response.end();
});

bayeux.attach(server);
server.listen(8000);
