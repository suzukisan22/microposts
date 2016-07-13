class UsersController < ApplicationController
  
  def followings
  @user = User.find_by(params[:id])
  @users = @user.following_users 
  end
  
  def followers
  @user = User.find_by(params[:id])
  @users = @user.followed_users
  end
  
  
  
   def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts
   @followings = @user.following_users
   @followers = @user.followed_users
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
    @user = current_user
  end
  
   def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      #保存に成功した場合はトップページへダイレクト
      flash[:success] = "Edit succeed"
      redirect_to :action => "show"
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile, :job)
  end
end
  
  
