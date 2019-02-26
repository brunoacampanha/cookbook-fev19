require 'rails_helper'

feature 'user delete recipe' do
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

    # Simulando acao do usuario

    visit root_path
    click_on recipe.title

    click_on 'Excluir Receita'
    
    expect(current_path).to eq root_path
    expect(page).to have_content("Item excluido com sucesso")
    expect(Recipe.count).to eq 1 



 
  end

end