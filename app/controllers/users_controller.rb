class UsersController < ApplicationController
  # before_action :authenticate_user!

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
  		redirect_to user_path(current_user)
  	else
  		flash[:error] = '名前とメールアドレスを入力してください。'
  		render "edit"
  	end
  end

  def confirm
  end

  def withdraw
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email)
  end
end
