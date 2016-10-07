module OrdersHelper

  def order_status_name(status)
    Order.human_attribute_name("status.#{status}")
  end

  def order_action_button(order)
    button_to 'Update', action: :update
  end
end
