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


  private

  def gotoParam
    params.require(:recipe).permit(:name, :description)
  end

end
