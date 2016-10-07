class UpdateOrder
  attr_reader :order, :params

  def self.call(order, params)
    new(order, params).call
  end

  def initialize(order, params)
    @order = order
    @params = params
  end

  def call
    order.assign_attributes params.slice(:status)
    if order.save
      send_notification order
      update_status order
    end
    return order
  end

  private

  def send_notification(order)
    OrderMailer.notification(order).deliver_now
  end

  def update_status(order)
    OrderChannel.broadcast_to order, id: order.id
  end
end