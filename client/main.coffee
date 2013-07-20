$(document).ready ->
    host = window.document.location.host.replace /:.*/, ""
    console.log "Connecting to", "ws://" + host + ":3141"
    ws = new WebSocket "ws://" + host + ":3141"

    ws.onopen = ->
        $("#submit").click ->
            ws.send $("#message").val()

    ws.onmessage = (event) ->
        alert event.data

    ws.onclose = (event) ->
        console.log "WebSocket closed:", event