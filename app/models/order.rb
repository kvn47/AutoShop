class Order < ApplicationRecord
  scope :active, -> { where.not status: :issued }
  scope :ordered, -> { order created_at: :desc }
  belongs_to :customer, class_name: 'User'
  has_many :order_items
  enum status: %i[registered processing ready issued]

  def total_sum
    order_items.sum :price
  end
end
