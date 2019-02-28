require 'rails_helper'

#cria os dados necessários
feature 'user favorite recipe' do
  scenario 'succesfully' do
    a = RecipeType.create(name: 'Sobremesa')
    b = Cuisine.create(name: 'Brasileira')
    c = Recipe.create(title: 'Bolo de cenoura', recipe_type: a,
                          cuisine: b, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          favorite: false)

    #simula a ação do usuário
    visit root_path
    click_on c.title
    click_on 'favorita'

    #expectativas do usuário após a ação
    
    
    expect(current_path).to eq recipe_path(c.id) 
    expect(page).to have_css('img.star')
    expect(page).to have_css('img[src*="star"]')
    expect(page).to have_link('desfazer favorita')
  end

  scenario 'succesfully' do
    a = RecipeType.create(name: 'Sobremesa')
    b = Cuisine.create(name: 'Brasileira')
    c = Recipe.create(title: 'Bolo de cenoura', recipe_type: a,
                          cuisine: b, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                          favorite: true)

    #simula a ação do usuário
    visit root_path
    click_on c.title
    click_on 'desfazer favorita'

    #expectativas do usuário após a ação
    
    
    expect(current_path).to eq recipe_path(c.id) 
    expect(page).not_to have_css('img.star')
    expect(page).not_to have_css('img[src*="star"]')
    expect(page).to have_link('favorita')
  end
end
