# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root to: 'users#index'
  get 'buy', to: 'users#buy'
  get 'all_users', to: 'users#all_users'
  get '/search', to: 'users#search'
  
  namespace :admin do
    resources :books do
      collection do
        get 'search'
      end
    end
    resources :plans
  end

  resources :issues, only: [:index, :new]
  resources :users 
  
end 
