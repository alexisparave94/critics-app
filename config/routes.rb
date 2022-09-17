Rails.application.routes.draw do
  root "games#index"
  resources :games do
    resources :involved_companies, only: %i[create destroy]
  end
  resources :companies
end
