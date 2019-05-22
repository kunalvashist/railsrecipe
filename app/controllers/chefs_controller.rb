class ChefsController < ApplicationController
  def index

  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Created Successfully"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  private
  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation)
  end
end
