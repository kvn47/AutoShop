class User < ApplicationRecord
  has_many :orders, foreign_key: :customer_id
  has_one :current_order, -> { active }, class_name: 'Order', foreign_key: :customer_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name, :email

  def presentation
    "#{name} [#{email}]"
  end
end
