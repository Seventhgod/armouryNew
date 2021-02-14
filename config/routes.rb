require 'sidekiq/web'

Rails.application.routes.draw do
  get 'trial/index'
  resources :officers
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
  get '/getarmname', to: 'armrequests#getarms'
  get '/getsoldiers', to: 'armrequests#getsoldiers'
  get '/getofficers', to: 'armrequests#getofficers'
  get 'delarmreq', to: 'armrequests#ajaxdelete'
  get 'delarm', to: 'arms#ajaxdelete'
  mount Sidekiq::Web => '/sidekiq'
end
