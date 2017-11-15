Rails.application.routes.draw do
  resources :relations
  devise_for :users
  
  resources :users do
  	resources :tweets
  end

  # resources :friendships
  resources :tweets do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
