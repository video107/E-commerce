Rails.application.routes.draw do
  root "contacts#index"
  resources :contacts
  resources :orders do
    collection do
      get :pay2go_notify
    end
  end
end
