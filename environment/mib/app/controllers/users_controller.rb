class UsersController < ApplicationController
    # layout 'mypage'  #マイページ（show）だけ別のcssを読み込ませる

# マイページへのリンク
    def show
        @user = current_user.id
        @nickname = current_user.nickname
        @height = current_user.height
        @weight = current_user.weight
        bmi_calc = @weight.to_f/@height.to_f**2*10000
        @bmi = BigDecimal(bmi_calc.to_s).floor(1)
        @contents = Content.where(user_id: current_user.id)
    end
    
    def new
        @user = User.new
    end
    
    def create
        user = User.find(params[:id])
        user.create(nickname: create_params[:nickname], height: create_params[:height], weight: create_params[:weight]) if user.id == current_user.id
        redirect_to '/'
    end
    
    def edit
        @user = User.find(params[:id])
    end
     
    def update
        user = User.find(params[:id])
        user.update(create_params) if user.id == current_user.id
        redirect_to '/'
    end
     
     private
     def create_params
           params.require(:user).permit(:nickname, :height, :weight)
     end
end

