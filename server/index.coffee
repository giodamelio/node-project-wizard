http = require "http"

express = require "express"
ws = require "ws"

# Create the express server
app = express()

# Serve the static files
app.use express.static(require("path").normalize(__dirname + "/../client"))

# Start listening
console.log "Listening on localhost:3141..."
server = http.createServer app
server.listen "3141"

# Setup websockets
wss = new ws.Server { server: server }
wss.on "connection", (ws) ->
    ws.on "message", (message) ->
        console.log "Got message", message
        ws.send "Echo: " + message

    ws.on "close", ->
        console.log("Websocket closed");
