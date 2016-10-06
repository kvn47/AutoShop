class Order < ApplicationRecord
  scope :active, -> { where.not status: :issued }
  scope :ordered, -> { order created_at: :desc }
  belongs_to :customer, class_name: 'User'
  enum status: %i[registered processing ready issued]
end
