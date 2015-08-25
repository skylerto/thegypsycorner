Rails.application.routes.draw do



  mount Ckeditor::Engine => '/ckeditor'

get '/artists' => 'artists#index'
get '/artists/:id' => 'artists#show'
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
