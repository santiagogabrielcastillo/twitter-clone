Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get '/home', to: 'tweets#home', as: :tweet_root_path

  resources :tweets, only: %i[create update]
end
