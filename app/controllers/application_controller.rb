class ApplicationController < ActionController::Base
  before_action :authenticate_user!, expect: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resourse)
    about_path
  end
  
  def after_sign_out_path_for(resourse)
    # ここから勝手に変更
    # about_path　　＜＝もとはこれ
    root_path
    # ここまで
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
