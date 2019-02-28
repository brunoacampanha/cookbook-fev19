require 'rails_helper'

feature 'Login user recipe' do
  scenario 'succesfully' do
    #cria os dados necessários
    User.create!(email: 'admin@email.com',
                password: '123456')
    
    #simulação do usuário
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    #expectativa do usuário
    expect(current_path).to eq root_path
    expect(page).to have_link('Sair') 
    expect(page).not_to have_link('Entrar')
  end

  scenario 'End in Sing out' do
    #cria os dados necessários
    User.create!(email: 'admin@email.com',
    password: '123456')

    #simulação do usuário
    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'admin@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'
    click_on 'Sair'

    #expectativa do usuário
    expect(current_path).to eq root_path
    expect(page).to have_link('Entrar') 
    expect(page).not_to have_link('Sair')
    
  end
end