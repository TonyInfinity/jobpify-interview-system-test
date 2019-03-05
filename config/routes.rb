require 'sidekiq/web'

Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  
  resources :conversations do
    resources :messages
  end
  
  resources :jobs do
    resources :likes
  end
  
  root to: 'home#index'
  
  get '/forum' => 'pages#forum'
  get '/students-faq' => 'pages#students-faq'
  get '/recruiters-faq' => 'pages#recruiters-faq'
  get '/terms-of-service' => 'pages#terms-of-service'
  get '/employer/dashboard' => 'jobs#dashboard'
  get '/jobpy-search' => 'pages#jobpy-search'
end
