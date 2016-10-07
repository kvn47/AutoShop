$(document).on 'turbolinks:load', ->
  if $('#orders').length
    App.admin_orders = App.cable.subscriptions.create "AdminOrdersChannel",
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        if data.id and $('#orders').length
          $.getScript("/admin/orders/#{data.id}")
