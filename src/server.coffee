express = require('express')
app = express()
server = require('http').Server(app)
fs = require 'fs'
io = require('socket.io')(server)

# bodyParser = require 'body-parser'
# app.use bodyParser.urlencoded {extended:false}
# app.use require 'express-ejs-layouts'
# app.use require 'express' .static 'public'

app.set 'view engine', 'ejs'

app.get '/', (request, response) ->
	fs.readdir 'code', (err, files) ->
		response.render 'index', files: files


module.exports = server

