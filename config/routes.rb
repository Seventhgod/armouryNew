require 'sidekiq/web'

Rails.application.routes.draw do
  get 'trial/index'
  resources :arms
  resources :trial
  resources :armrequests
  resources :soldiers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
    root 'devise/sessions#new'
  end
  get '/updatereqstat', to: 'armrequests#updatereqstat'
  mount Sidekiq::Web => '/sidekiq'
end
