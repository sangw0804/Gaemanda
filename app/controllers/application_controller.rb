class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :dog_name, :dog_kind,:is_male_dog, :location, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image,:dog_name, :dog_kind,:is_male_dog, :location, :introduction])
  end
end
