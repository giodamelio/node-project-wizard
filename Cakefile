spawn = (cmd, options) ->
    child_process = require "child_process"
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()

task "server", "Start the server", ->
    spawn "./node_modules/.bin/coffee", "server/index.coffee"

task "watch:server", "Watch and auto-restart the server", ->
    spawn "./node_modules/.bin/nodemon", "-q -w server server/index.coffee"

task "client", "Build the client", ->
    spawn "./node_modules/.bin/browserify", "-t coffeeify -o client/bundle.js client/main.coffee"

task "watch:client", "Watch and auto-build the client", ->
    spawn "./node_modules/.bin/nodemon", "-q -w client -x ./node_modules/.bin/browserify -t coffeeify -o client/bundle.js -w client client/main.coffee"

task "watch:both", "Watch and auto-reload the server and auto-build the client", ->
    invoke "watch:server"
    invoke "watch:client"