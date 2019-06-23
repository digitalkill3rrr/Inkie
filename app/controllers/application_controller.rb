class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # load_and_authorize_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ role: 'user' }, :nickname, :email, :password)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
