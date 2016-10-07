module OrdersHelper

  def order_status_name(status)
    Order.human_attribute_name("status.#{status}")
  end

  def order_action_button(order)
    _action = order.allowed_action_for current_user
    _action ? button_to(_action[:presentation], {action: _action[:name]}, class: 'btn btn-primary', id: 'order-action') : ''
  end
end
