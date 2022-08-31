Rails.application.routes.draw do
  resources :trains do
    resources :vagons, shallow: true
    resources :tickets, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :tickets, only: [:index]
  resource :search_ticket, only: [:new, :show, :edit] do
    post '/', to: 'search_tickets#find'
  end
  # resources :vagons
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
