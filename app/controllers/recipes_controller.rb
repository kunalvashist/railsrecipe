class RecipesController < ApplicationController

  def index
    @recipe = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(gotoParam)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = " Recipe Created Successfully "
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
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

  def gotoParam
    params.require(:recipe).permit(:name, :description)
  end

end
