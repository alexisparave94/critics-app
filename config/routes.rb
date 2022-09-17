Rails.application.routes.draw do
  root "games#index"
  resources :games do
    resources :involved_companies, only: %i[create]
  end
  resources :companies
end
