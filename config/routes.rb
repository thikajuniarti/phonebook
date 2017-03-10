Rails.application.routes.draw do
  devise_for :users
  #get 'book/index'
  resources :books

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end