class PagesController < ApplicationController

  def index
    if current_user.is_admin?
      redirect_to admin_orders_path
    elsif current_user.current_order.present?
      redirect_to current_user.current_order
    else
      redirect_to new_order_path
    end
  end
end
