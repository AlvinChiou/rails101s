class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :configure_permitted_parameters, :if => :devise_controller?

  protected
  def configure_permitted_parameters
    # 加入新增姓名欄位的 strong_parameters
    devise_parameter_sanitizer.for(:sign_up){
      |u| u.permit(:name, :email, :password, :password_confirmation)
    }

    # 加入edit_account 的 strong_parameters
    devise_parameter_sanitizer.for(:account_update){
      |u| u.permit(:name, :email, :password, :password_confirmation, :current_password)
    }

  end

end
