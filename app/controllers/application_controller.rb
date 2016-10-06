class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user.is_admin? ? admin_components_path : root_path
  end
end
