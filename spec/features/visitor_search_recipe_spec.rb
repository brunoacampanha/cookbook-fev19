require 'rails_helper'

feature 'Visit search recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    user = User.create!(email: 'admin@email.com',
    password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', 
                          recipe_type: recipe_type,
                          user: user,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
        
    recipe_other = Recipe.create(title: 'Bolo de chocolate', 
                                recipe_type: recipe_type,
                                cuisine: cuisine, difficulty: 'Médio',
                                cook_time: 60,
                                user: user,
                                ingredients: 'Farinha, açucar, cenoura',
                                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      #Ação do usuário
      login_as(user, scope: :user)
      visit root_path
      fill_in 'Buscar', with: 'Bolo de cenoura'
      click_on 'Buscar'

      #expectativa do usuário
      expect(page).to have_css('h1', text: 'Resultados da busca')
      expect(page).to have_content('Bolo de cenoura')
      expect(page).not_to have_content('Bolo de chocolate')
  end

  scenario 'unsucesfully' do
    #cria os dados necessário
    user = User.create!(email: 'admin@email.com',
    password: '123456')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', 
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

    #Ação do usuário
    login_as(user, scope: :user)
    visit root_path
    fill_in 'Buscar', with: 'Bolo de cenoura com cobertura'
    click_on 'Buscar'

    #expectativa do usuário
    expect(page).to have_css('h1', text: 'Nenhuma receita encontrada')
    expect(page).not_to have_content('Bolo de chocolate')
  end

  
end