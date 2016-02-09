Rails.application.routes.draw do
  

    resources :sessions, only: [:create, :destroy]
    
    
 
 root 'products#index'
 
 resources :products do
  
   member do
    
    get :checkout
    patch :buy
 end
 end
end
