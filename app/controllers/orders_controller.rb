class OrdersController < ApplicationController
  before_action :set_order, only: %i[show udpate destroy]

  def new
    @components = Component.all
  end

  def create
    @order = CreateOrder.(current_user, order_params)
    respond_to do |format|
      if @order.persisted?
        format.html { redirect_to @order, notice: 'Order created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to root_path, notice: 'Order was successfully updated.' }
      else
        format.html { render :show }
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
    params.require(:order).permit(component_groups: [:component_id])
  end
end
