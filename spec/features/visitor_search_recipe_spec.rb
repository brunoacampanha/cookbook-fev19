require 'rails_helper'

feature 'Visit search recipe'
  scenario 'successfully' do
         #cria os dados necessários
         recipe_type = RecipeType.create(name: 'Sobremesa')
         cuisine = Cuisine.create(name: 'Brasileira')
         recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                                cuisine: cuisine, difficulty: 'Médio',
                                cook_time: 60,
                                ingredients: 'Farinha, açucar, cenoura',
                                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
        
         recipe_other = Recipe.create(title: 'Bolo de chocolate', recipe_type: recipe_type,
                                cuisine: cuisine, difficulty: 'Médio',
                                cook_time: 60,
                                ingredients: 'Farinha, açucar, cenoura',
                                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      #Ação do usuário
      visit root_path
      fill_in 'Buscar', with: 'Bolo de cenoura'
      click_on 'Buscar'
  end
end