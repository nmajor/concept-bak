Concept::Application.routes.draw do
  get "users/dashboard"
  get "highlights/create"
  root :to => "pages#home"
  get "pages/home"

  resources :templates, except: [:create]
  resources :highlights, only: [:create, :show]
  resources :rtbs, only: [:destroy]

  devise_for :users
end
