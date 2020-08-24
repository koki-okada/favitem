class ItemsController < ApplicationController
    def index
    end
    
    def new
        @item=Item.new
    end
    
    def create
        Item.create(post_params)
    end
    
    private 
    def post_params
        params.require(:item).permit(:name, :text, :img)
    end
end
