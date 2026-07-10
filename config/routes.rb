Rails.application.routes.draw do
  root "pokemons#index"

  get "about", to: "pages#about"

  resources :pokemons, only: [:index, :show]
  resources :types, only: [:show]
end