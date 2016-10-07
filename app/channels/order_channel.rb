# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class OrderChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    order = Order.find params[:id]
    stream_for order
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
