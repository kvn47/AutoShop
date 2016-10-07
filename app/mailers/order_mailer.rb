class OrderMailer < ApplicationMailer

  def notification(order)
    @order = order
    mail to: @order.email, subject: 'Order status'
  end
end
