Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'home/index'

  # get 'home/show'

  root 'adverts#index' 

  resources :adverts, only: [:index, :show, :new, :create]

  resources :user_adverts


end
