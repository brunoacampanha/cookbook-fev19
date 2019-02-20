require 'rails_helper'

feature 'User should not create a recipe' do
  scenario 'with cook time zero'do
  #Verifica se o tempo de preparo = 0
  
  #Simula ação do usuário  
  visit root_path
    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Pizza'
    fill_in 'Tipo da Receita', with: 'Principal'
    fill_in 'Cozinha', with: 'Italiana'
    fill_in 'Dificuldade', with: 'Media'
    fill_in 'Tempo de Preparo', with: '0'
    fill_in 'Ingredientes', with: 'Farinha de trigo'
    fill_in 'Como Preparar', with: 'Misture e amasse'
    click_on 'Enviar'

    expect(page).to have_content('Tempo de preparo tem que ser maior que zero!')
  end

  scenario 'with negative cook time' do

#Verifica se o tempo de preparo é negativo
  
  #Simula ação do usuário  
  visit root_path
  click_on 'Enviar uma receita'

  fill_in 'Título', with: 'Pizza'
  fill_in 'Tipo da Receita', with: 'Principal'
  fill_in 'Cozinha', with: 'Italiana'
  fill_in 'Dificuldade', with: 'Media'
  fill_in 'Tempo de Preparo', with: '-1'
  fill_in 'Ingredientes', with: 'Farinha de trigo'
  fill_in 'Como Preparar', with: 'Misture e amasse'
  click_on 'Enviar'

  expect(page).to have_content('Tempo de preparo não pode ser negativo')


  end

end