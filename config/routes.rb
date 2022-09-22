Rails.application.routes.draw do
  root "games#index"
  resources :games do
    resources :involved_companies, only: %i[create destroy]

    post "add_genre", on: :member
    delete "remove_genre", on: :member

    post "add_platform", on: :member
    delete "remove_platform", on: :member
    
    resources :critics, only: %i[create]
  end
  resources :companies
end
