Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contents#index'
  
  # ルーティングのネスト
  resources :contents do
      resources :comments, only: [:show, :edit, :create, :delete]
  end
  
  resources :users
end
