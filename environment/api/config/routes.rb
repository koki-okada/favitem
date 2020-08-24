#ルーティングの設定
Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    collection do
      post 'purchase'
    end
  end
end
