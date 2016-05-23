class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource
  protect_from_forgery with: :exception

  def layout_by_resource
    if devise_controller?
      false
    end
  end
end
