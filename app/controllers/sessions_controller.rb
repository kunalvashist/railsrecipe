class SessionsController < ApplicationController
  def new

  end

  def create
    chef = Chef.find_by(email: params[:sessions][:email].downcase)
    if chef && chef.authenticate(params[:sessions][:password])
      session[:chef_id] = chef.id
      flash[:success] = "Logged in successfully"
      redirect_to chef_path(chef)
    else
      flash.now[:danger] = "There was something wrong with credentials"
      render 'new'
    end

  end

  def destroy
    session[:chef_id] = nil
    flash.now[:success] = "You have logout"
    redirect_to root_path
  end

  private
  def format_param

  end
end