class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @recipes = Recipe.all
    @lists = current_user.lists
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe.user = current_user
    @recipe_types = RecipeType.all
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    if @recipe.save
    redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    if @recipe.update(recipe_params)
    redirect_to @recipe
    else
      render 'edit'
    end    
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    flash[:message] = "Item excluido com sucesso"
    redirect_to root_path
  end

  def search
    @recipes = Recipe.where("title = ? ", params[:busca])
  end

  def favorite
    @recipe = Recipe.find(params[:id])
    @recipe.update(favorite: true)
    redirect_to  @recipe
  end

  def unfavorite
    @recipe = Recipe.find(params[:id])
    @recipe.update(favorite: false)
    redirect_to @recipe
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty,
                                   :cook_time, :ingredients, :cook_method, :photo, :busca, :favorite)
  end
end
