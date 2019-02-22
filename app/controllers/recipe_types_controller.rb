class RecipeTypesController < ApplicationController

  def new
    @recipe_type = RecipeType.new
  end

  def create
   @recipe_type = RecipeType.new(name: params[:recipe_type][:name])
   if @recipe_type.save 
   redirect_to @recipe_type
   else 
    flash[:error] = "Você deve informar o nome do tipo de receita"
    render :new
   end
  end

  def show
    @recipe_type = RecipeType.find(params[:id])
  end
end