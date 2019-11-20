class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
    
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規作成しました。"
      redirect_to user_url @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
     if @user.update_attributes(user_params)
       flash[:success] = "更新しました。"
       redirect_to user_url @user
     else
       render :edit
     end
  end
  
  def destroy
  end

private
    
    def set_user
      @user = User.find(params[:id])
    end
   
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to root_url
      end
    end

   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end