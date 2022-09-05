Rails.application.routes.draw do
  devise_for :users

  resources :trains do
    resources :vagons, shallow: true
    resources :tickets, shallow: true
  end

  resources :tickets, only: [:index]
  resource :search_ticket, only: [:new, :show, :edit, :create] do
    post '/', to: 'search_tickets#find'
  end

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes
    resources :tickets
  end

  # resources :vagons
  get 'welcome/index'

  root 'search_tickets#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
