process.env.NODE_ENV = 'test'
Browser = require 'zombie'
fs = require 'fs'
chai = require 'chai'
expect = chai.expect
server = require '../src/server'

describe 'Home page', ->
	browser = null

	before ->
		@server =  server.listen(3000)
		browser = new Browser { site: 'http://localhost:3000' }
		fs.writeFile "code/_test.txt", "Hellowwww"

	before (done) ->
		browser.visit('/', done)

	after -> 
		fs.unlink('code/_test.txt')

	it 'should show a welcome message', ->
			expect(browser.text('h1')).to.equal("Welcome to Makers IDE")
