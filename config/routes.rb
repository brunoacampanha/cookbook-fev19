Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  
  resources :recipes do 
    post 'favorite', on: :member
    delete 'unfavorite', on: :member
    get 'search', on: :collection
  end
  resources :recipe_types
end
