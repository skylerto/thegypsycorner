Rails.application.routes.draw do



  namespace :artists do
    resources :portfolios
  end
  namespace :artists do
    resources :pieces
  end
  resources :tags
  namespace :blog do
    get '/myjourney' => 'posts#my_journey'
    get '/sacredcorner' => 'posts#sacred_corner'
    resources :posts
  end
  devise_for :users

  root 'pages#home'


end
