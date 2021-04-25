Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create]
  resources :boards, only: [:index, :show, :create]
  resources :categories, only: [:index, :show, :create]
  resources :tasks, only: [:index, :show, :create, :update]
end
