Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'home/index'

  # get 'home/show'

  root 'home#index' 

  resources :home, only: [:index, :show, :new, :create]


end
