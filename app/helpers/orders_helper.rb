module OrdersHelper

  def order_status_name(status)
    Order.human_attribute_name("status.#{status}")
  end
end
