class AddFavoriteToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :favorite, :boolean
  end
end