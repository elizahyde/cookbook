class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    #authenticate comes from the has_secure_password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:notice] = "No Dice. Password or Username incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, :notice => "Seeya!"
  end
end