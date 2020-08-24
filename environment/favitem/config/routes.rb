Rails.application.routes.draw do
    
  resources :items, only: [:index, :new, :create]
  root to: 'items#index'
  
end
