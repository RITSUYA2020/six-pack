class UsersController < ApplicationController
   before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @work_outs = @user.work_outs.reverse_order
    @comment = Comment.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = 'プロフィールの編集を保存しました。'
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = '名前とメールアドレスを入力してください。'
  		render "edit"
  	end
  end

  def confirm
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def follows
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :profile_image)
  end
end
