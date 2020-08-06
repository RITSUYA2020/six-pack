class Users::SessionsController < Devise::SessionsController

	before_action :reject_user, only: [:create]

	protected
	def reject_user
		@user = User.find_by(email: params[:user][:email].downcase) #downcaseメソッドは大文字を小文字に変換するメソッド
		if @user
			if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
				flash[:error] = "退会済みです。"
				redirect_to new_user_session_path
			end
		end
	end

end
