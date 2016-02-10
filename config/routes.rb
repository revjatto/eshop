Rails.application.routes.draw do
 
 resources :sessions, only: [:create, :destroy]
     
     
  resources :users, except: [:index, :destroy] do
 
 member do
  
  get :history
 end
end

 resources :products do
  
   member do
    
    get :checkout
    patch :buy
 end
 end
 
  root 'products#index'
end
