Rails.application.routes.draw do



  resources :tags
  namespace :blog do
    get '/myjourney' => 'posts#my_journey'
    get '/sacredcorner' => 'posts#sacred_corner'
    resources :posts
  end
  devise_for :users

  root 'pages#home'


end
