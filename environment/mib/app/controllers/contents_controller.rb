class ContentsController < ApplicationController
    before_action :move_to_index, except: :index
    
    def index
        @contents = Content.all
    end
    
    
    def new
        @content = Content.new
    end
    
    def create
        # binding.pry
        Content.create(title: create_params[:title], text: create_params[:text], user_id: current_user.id, img: create_params[:img])
        redirect_to "/"
    end
    
    def show
        @content = Content.find(params[:id])
    end
    
    def edit
        @content = Content.find(params[:id])
    end
    
    def update
        content = Content.find(params[:id])
        content.update(title: create_params[:title], text: create_params[:text], user_id: current_user.id)if user_signed_in? && current_user.id == content.user_id
        redirect_to "/"
    end
    
    def destroy
        content = Content.find(params[:id])
        content.destroy if user_signed_in? && current_user.id == content.user_id
        redirect_to "/"
    end
    
    
    private
    def create_params
        params.require(:content).permit(:title, :text, :user_id, :img)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
end
