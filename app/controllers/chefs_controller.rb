class ChefsController < ApplicationController
  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 1)

  end

  def show
    @chef = Chef.find(params[:id])
    @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page:1)
  end

  def new
    @chef = Chef.new
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])

    if @chef.update(chef_params)
      flash[:success] = "Updated Successfully"
      redirect_to @chef
    else
      render "edit"
    end
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
