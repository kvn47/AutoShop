$(document).on 'turbolinks:load', ->
  if ($order = $('.order')).length
    App.cable.subscriptions.create {channel: 'OrderChannel', id: $order.data('id')},
      received: (data)->
        if data.id
          $.getScript("/orders/#{data.id}")


#App.order = App.cable.subscriptions.create "OrderChannel",
#  connected: ->
#    # Called when the subscription is ready for use on the server
#
#  disconnected: ->
#    # Called when the subscription has been terminated by the server
#
#  received: (data) ->
#    if data.id
#      $.getScript("/orders/#{data.id}")
