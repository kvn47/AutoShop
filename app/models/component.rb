class Component < ApplicationRecord
  scope :ordered, -> { order :group }

  validates_presence_of :name, :group, :price
  enum group: %i[body engine transmission]
end
