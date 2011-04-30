# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:password] == "monkey"
      session[:signed_in] = true
      redirect_to_stored_location
    else
      redirect_to new_session_path, :notice => "Password equivocado."
    end
  end
  
  def destroy
    session.delete(:signed_in)
    redirect_to root_path, :notice => "¡Hasta luego!"
  end
end
