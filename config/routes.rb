Rails.application.routes.draw do
  devise_for :users
  #get 'book/index'
  resources :books

  # get "edit_user/:id", to: "books#edit_user", as: :edit_user

  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
