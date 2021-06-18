Rails.application.routes.draw do
  
  get 'reservations' => 'reservations#index'
  
  post 'reservations/confirm'
 
  post 'reservations/create'
  
  get 'reservations/:id' => 'reservations#show'
  
  get 'rooms/search'
  
  get 'rooms/new' => 'rooms#new'
  post 'rooms/create'
  
  get 'rooms/posts'
  
  get 'rooms/:id' => 'rooms#show'
  
  get 'users/account' => 'users#account'
  
  get 'users/profile' => 'users#profile'
  
  patch 'users/profile_update' => 'users#profile_update'
  
  devise_for :users, controllers: {   registrations: 'users/registrations'}   
  
  root to: 'home#top'
  
end
