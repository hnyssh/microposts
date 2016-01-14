class UsersController < ApplicationController
  include SessionsHelper

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :current_user?, only:[:edit, :update]

  def show
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'ユーザーを編集しました'
    else
      render 'edit'
    end
  end
  


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :area)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def current_user?
    if @user != current_user
      redirect_to root_path, alert: "不正なアクセス"
    end
  end

end
