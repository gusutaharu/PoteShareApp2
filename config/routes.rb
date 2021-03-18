Rails.application.routes.draw do
  
  get 'rooms/new' => 'rooms#new'
  post 'rooms/create'
  
  get 'rooms/posts'
  
  get 'rooms/:id' => 'rooms#show'
  
  get 'users/account' => 'users#account'
  
  get 'users/profile' => 'users#profile'
  
  patch 'users/profile_update' => 'users#profile_update'
  
  devise_for :users

  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
