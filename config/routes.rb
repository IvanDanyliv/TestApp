# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index', as: 'home'
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  resources :users, only: %i[show index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
