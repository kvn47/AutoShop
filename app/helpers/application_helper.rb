module ApplicationHelper

  def title
    t 'application_name'
  end

  def home_path
    current_user&.is_admin? ? '/admin' : '/'
  end

  def currency(number)
    number_to_currency number, unit: '', separator: ',', delimiter: ' '
  end
end
