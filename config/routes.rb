Concept::Application.routes.draw do
  root :to => "pages#home"
  get "pages/home"

  resources :templates, except: [:create]

  devise_for :users
end
