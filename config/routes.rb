Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get '/home', to: 'tweets#home'

  resources :tweets, only: %i[create update]
end
