require('coffee-script/register')
http = require('./src/server.coffee')

port = process.env.port || 3000

var server = http.listen(port, function() {
console.log('listening on port 3000')
});

module.exports = server