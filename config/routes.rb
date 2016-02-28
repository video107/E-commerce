Rails.application.routes.draw do
  resources :contacts
  root "contacts#index"
  resources :products do
    resources :orders do
      post :confirm, on: :collection
    end
  end
end
