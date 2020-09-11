Rails.application.routes.draw do
  root to: 'codes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :codes, only: [:index]
end
