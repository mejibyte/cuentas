# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :signed_in?
  
  private 
  
  def signed_in?
    session[:signed_in] != nil
  end
  
  def authenticate_user!
    unless session[:signed_in]
     store_target_location
     redirect_to new_session_path, :alert => "Por favor identifícate primero." 
    end
  end
  
  def store_target_location
    session[:return_to] = request.url
  end
  
  def redirect_to_stored_location
    redirect_to(session.delete(:return_to) || root_path)
  end
end
