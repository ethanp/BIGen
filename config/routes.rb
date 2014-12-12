Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :categories
  resources :recordings
  put '/follow/:category_id' => 'users#follow_category', as: 'follow'
end
