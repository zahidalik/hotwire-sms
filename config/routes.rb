Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users do
    resources :schools, except: [:edit, :update]
  end

  resources :schools, only: [:edit, :update]
end
