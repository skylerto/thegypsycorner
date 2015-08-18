Rails.application.routes.draw do

  namespace :blog do
    resources :posts
  end
  devise_for :users

  root 'pages#home'
end
