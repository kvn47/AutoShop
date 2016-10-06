module Admin
  class OrdersController < BaseController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      @orders = Order.ordered
    end

    def show
    end

    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        else
          format.html { redirect_to @order, alert: 'Order was not updated.' }
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
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:status)
    end
  end
end
