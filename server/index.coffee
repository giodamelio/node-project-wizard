express = require "express"

server = express()

server.use express.static(require("path").normalize(__dirname + "/../client"))

console.log "Listening on localhost:3141..."
server.listen "3141"
