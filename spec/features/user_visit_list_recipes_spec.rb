require 'rails_helper'

feature 'Visit List recipes' do
  scenario 'Succesfully' do
    #cria dados necessários
    user = User.create!(email: 'admin@email.com',
    password: '123456')
    list = List.create(name: 'Receitas de Natal',
                      user: user)
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de Cenoura', 
                            recipe_type: recipe_type,
                            user: user,
                            cuisine: cuisine, difficulty: 'Médio',
                            cook_time: 60,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    
    recipe_other = Recipe.create(title: 'Bolo de chocolate', 
                            recipe_type: recipe_type,
                            cuisine: cuisine, difficulty: 'Médio',
                            user: user,
                            cook_time: 60,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    list_recipes = ListRecipe.create(list: list, recipe: recipe)

    #ação do usuário
    login_as(user, scope: :user)
    visit root_path
    click_on 'Receitas de Natal'
    
    #expectativas do usuário
    expect(page).to have_link('Bolo de Cenoura')
    expect(page).not_to have_link('Bolo de Chocolate')
    
  end
end