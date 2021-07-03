# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    get '/admin/users/:id/download', to: 'admin/users#download', as: :admin_users_download
  root 'home#index', as: 'home'
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  resources :users, only: %i[show index]
  resources :projects, only: %i[index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
