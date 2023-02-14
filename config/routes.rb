Rails.application.routes.draw do
  resources :invoices do 
    get 'preview', on: :new
  end
  resources :vendors
  resources :companies
  resources :work_orders
  root "pages#home"

  devise_for :users
  resources :timesheets
  resources :users
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
