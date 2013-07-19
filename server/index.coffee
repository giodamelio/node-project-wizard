connect = require "connect"

server = connect()

server.use connect.static(require("path").normalize(__dirname + "/../client"))

console.log "Listening on localhost:3141..."
server.listen "3141"
