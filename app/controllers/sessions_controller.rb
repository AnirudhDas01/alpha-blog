class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In"
      redirect_to user

    else
      flash.now[:alert] = "Invalid email or Password or both"
      render :new , status: :unprocessable_entity
    end
  end

  def destroy
      session[:user_id] = nil
      flash[:alert] = "Logged Out Successfully"
      redirect_to root_path
  end
end
