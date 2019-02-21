class RecipeTypesController < ApplicationController

  def new
    @recipe_type = RecipeType.new
  end
end