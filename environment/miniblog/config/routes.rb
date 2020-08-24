Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'

  get '/' => 'blogs#index'
  get '/new' => 'blogs#new'
  
  # 投稿された記事本文を受け取って、createメソッドに送る
  post 'blogs' => 'blogs#create'
  
  # 記事の編集の機能
  get '/:id/edit' => 'blogs#edit'
  patch 'blogs/:id' =>'blogs#update'
  
  #記事の削除機能
  get '/:id/delete' => 'blogs#destroy'
  
  #記事の詳細画面
  get '/:id/show' => 'blogs#show'
  
  
  # ログアウト
   devise_scope :social_account do
     get 'sign_out', to: "sessions#destroy"
   end

end
