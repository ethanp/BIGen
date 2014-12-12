Rails.application.routes.draw do
  resources :categories

  resources :recordings

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
