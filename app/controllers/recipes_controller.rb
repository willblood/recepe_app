class RecipesController < ApplicationController
  def new 
  end
  

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.new(create_params)
    if recipe.save
      flash[:success] = "Recipe created successfully"
      redirect_to recipes_path
    else
      flash[:error] = "Failed to create recipe - ensure all fields are filled and the recipe name is unique"
      redirect_to recipes_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(update_params)
      flash[:success] = "Recipe updated successfully"
      redirect_to recipe_path(recipe)
    else
      flash[:error] = "Failed to update recipe"
      redirect_to edit_recipe_path(recipe)
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:success] = "Recipe deleted successfully"
      redirect_to recipes_path
    else
      flash[:error] = "Failed to delete recipe"
      redirect_to recipes_path
    end
  end

  private
  def create_params
    params.permit(:name, :ingredients, :instructions)
  end
  def update_params
    params.require(:recipe).permit(:name, :ingredients, :instructions)
  end
end