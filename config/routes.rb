Rails.application.routes.draw do
  resources :contacts do
    resources :events
  end
  resources :events, only: [:index]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#splash'
end
