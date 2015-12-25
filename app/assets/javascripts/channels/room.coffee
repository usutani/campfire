App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'click', '#room_speaker_button', () ->
  App.room.speak $('#room_speaker').val()
  editor = document.querySelector("trix-editor").editor
  editor.setSelectedRange([0, Infinity])
  editor.deleteInDirection("backward")
  return

