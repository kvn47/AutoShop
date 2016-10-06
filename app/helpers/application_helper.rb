module ApplicationHelper

  def title
    t 'application_name'
  end

  def home_path
    current_user&.is_admin? ? '/admin' : '/'
  end
end
