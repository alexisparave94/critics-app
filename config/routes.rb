Rails.application.routes.draw do
  root "games#index"
  resources :games do
    resources :involved_companies, only: %i[create destroy]
    post "add_genre", on: :member
    delete "remove_genre", on: :member
  end
  resources :companies
end
