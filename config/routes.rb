Rails.application.routes.draw do

  resources :tags
  namespace :blog do
    resources :posts
  end
  devise_for :users

  root 'pages#home'
end
