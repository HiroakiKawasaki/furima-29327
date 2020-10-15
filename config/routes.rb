Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  post '/items/:id/edit' => 'items#edit'
  
  resources :users
  resources :items
  resources :orders do
    resources :items, only: [:create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
