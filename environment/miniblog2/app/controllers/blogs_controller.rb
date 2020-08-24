class BlogsController < ApplicationController
    def index
        @blogs = Blog.all.order("id DESC")
    end
    
    def new
    end
end
