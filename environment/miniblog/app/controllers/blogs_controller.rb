class BlogsController < ApplicationController
    before_action :move_to_index, except: [:index, :show]
    
    def index
       @blogs = Blog.all.order("id DESC")
    end
    
    def new
    end
    
    # Blogモデルへ記事の内容をDBへ追加依頼
    def create
        Blog.create(text: blog_params[:text], user_id: current_user.id)
        redirect_to '/'
    end
    
    # 記事の内容を@blogに代入する
    def edit
        @blog = Blog.find(params[:id])
    end
    
    def update
        blog = Blog.find(params[:id])
        blog.update(blog_params)
        redirect_to '/'
    end
    
    #記事の削除機能
    def destroy
        blog = Blog.find(params[:id])
        blog.destroy 
        # if  blog.user_id == current_user.id
        redirect_to '/'
    end
    
    def show
        @blog = Blog.find(params[:id])
    end
    
    private
    def blog_params
        params.permit(:text, :user_id)
    end    
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end   
    
end
