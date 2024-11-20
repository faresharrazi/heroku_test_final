Rails.application.routes.draw do
  resources :accounts do
    resources :transactions
  end
 root "home#index"
end
