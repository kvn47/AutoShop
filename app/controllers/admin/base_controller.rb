module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin!

    def index

    end

    private

    def authenticate_admin!

    end
  end
end