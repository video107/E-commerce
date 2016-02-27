Rails.application.routes.draw do
  resource :contacts
  root "contacts#index"
end
