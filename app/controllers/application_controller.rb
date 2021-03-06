class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kawasaki' && password == '1515'
    end
  end
end
