module Admin
  class BaseController < ApplicationController

    def index
      @orders = Order.active.ordered
    end
  end
end