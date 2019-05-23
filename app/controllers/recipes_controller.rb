class RecipesController < ApplicationController

  before_action :set_recipe, only: [:show,:edit,:update]

  def index
    @recipe = Recipe.paginate(page: params[:page], per_page: 1)

  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(gotoParam)
    @recipe.chef = current_chef
    if @recipe.save
      flash[:success] = " Recipe Created Successfully "
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(gotoParam)
      flash[:success] = " Recipe Editted Successfully "
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:success] = " Recipe Deleted Successfully "
      redirect_to recipes_path
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def gotoParam
    params.require(:recipe).permit(:name, :description)
  end

end
