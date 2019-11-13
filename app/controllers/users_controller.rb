class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規作成しました。"
      redirect_to user_url @user
    else
      render :new
    end
  end
  
  def update
  end
  
  def destroy
  end

private

   def set_user
    @user = User.find(params[:id])
   end
  
   def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end
end