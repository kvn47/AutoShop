class OrdersController < ApplicationController
  before_action :set_order

  def new
  end

  def create

  end

  def show
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
    end
  end

  private

  def set_order
    @order = params[:id] ? Order.find(params[:id]) : current_user.orders.build
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
