require 'rails_helper'

#cria os dados necessários
feature 'user favorite recipe' do
  scenario 'succesfully'do
  recipe_type = RecipeType.create(name: 'Sobremesa')
  cuisine = Cuisine.create(name: 'Brasileira')
  recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                         cuisine: cuisine, difficulty: 'Médio',
                         cook_time: 60,
                         ingredients: 'Farinha, açucar, cenoura',
                         cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                         favorite: false)

#simula a ação do usuário
visit root_path
click_on recipe.title

#expectativas do usuário após a ação

expect(page).to have_css('img[src*="star.jpg"]')
  end
end
