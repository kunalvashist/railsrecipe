class ChefsController < ApplicationController

  before_action :set_chef, only: [:show,:edit,:update,:destroy]
  before_action :require_some_user, only: [:edit,:update,:destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 1)
  end

  def show
    @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page:1)
  end

  def new
    @chef = Chef.new
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = "Updated Successfully"
      redirect_to @chef
    else
      render "edit"
    end
  end

  def destroy
    @chef.destroy
    flash[:danger] = " Deleted Successfully"
    redirect_to @chef
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef_id
      flash[:success] = "Created Successfully"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  private
  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:name, :email, :password, :password_confirmation)
  end

  def require_some_user
    if current_chef != @chef && !current_chef.admin?
      flash[:danger] = "You need to login with your id"
      redirect_to chefs_path
    end
  end

  def require_admin
    if loggedin? && !current_chef.admin?
      flash[:danger] = "You need to login with your id"
      redirect_to chefs_path
    end
  end
end
