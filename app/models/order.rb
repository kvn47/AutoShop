class Order < ApplicationRecord
  scope :active, -> { where.not status: :issued }
  scope :ordered, -> { order created_at: :desc }
  belongs_to :customer, class_name: 'User'
  has_many :order_items, dependent: :delete_all
  enum status: %i[registered assembling ready issued]
  delegate :email, to: :customer

  def total_sum
    order_items.sum :price
  end

  def status_presentation
    Order.human_attribute_name("status.#{status}")
  end

  def allowed_action_for(user)
    if registered? && user.is_admin?
      _presentation = I18n.t 'orders.to_assembling'
      _name = :assembly
    elsif assembling? && user.is_admin?
      _presentation = I18n.t 'orders.ready'
      _name = :ready
    elsif ready? && user == customer
      _presentation = I18n.t 'orders.received'
      _name = :receive
    else
      _name = nil
    end
    _name ? {name: _name, presentation: _presentation} : nil
  end
end
