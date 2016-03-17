Rails.application.routes.draw do
  root "contacts#index"
  resources :contacts
  resources :orders do
    member do
      get :result
    end
    collection do
      post :pay2go_notify
    end
  end
end
