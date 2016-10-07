class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :component
  delegate :group, :name, to: :component, allow_nil: true

  def presentation
    [Component.human_attribute_name("group.#{group}"), name].join ' - '
  end
end