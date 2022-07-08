# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'issues/index'
  devise_for :users
  # get 'users/index'
  # root 'admin/plans#index'
  root to: 'users#index'
  get 'buy', to: 'users#buy'
  get 'all_users', to: 'users#all_users'
  get '/search', to: 'users#search'
  # post "search", to: "users#search"
  namespace :admin do
    resources :books do
      collection do
        get 'search'
      end
    end
    resources :plans
  end

  resources :issues
  resources :users
  # resources :books do
  #   collection do
  #     get 'search_book'
  #     post 'search_book'
  #   end
  # end

  # resources :books do
  #   collection do
  #     get 'search'
  #     post 'search'
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
