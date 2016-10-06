module Admin
  class PagesController < BaseController

    def index
      @orders = Order.active.ordered
    end
  end
end