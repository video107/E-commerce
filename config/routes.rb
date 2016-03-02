Rails.application.routes.draw do
  resources :contacts
  root "contacts#index"
  resources :products do
    resources :orders
  end
end
