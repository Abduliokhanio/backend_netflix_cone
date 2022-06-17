Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "movies#index"
  
  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new"

  get "/movies/:id", to: "movies#show"
end
