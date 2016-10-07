class CreateOrder
  attr_reader :customer, :components

  def self.call(customer, params)
    component_ids = params[:component_groups].map { |_, group| group[:component_id] }
    new(customer, component_ids).call
  end

  def initialize(customer, component_ids)
    @customer = customer
    @components = Component.where id: component_ids
  end

  def call
    order = Order.new customer: @customer
    components.each do |component|
      order.order_items.build component_id: component.id, price: component.price
    end
    order.save
    return order
  end
end