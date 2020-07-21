class CommentsController < ApplicationController

	def create
		@work_out = WorkOut.find(params[:work_out_id])
		@new_comment = Comment.new(comment_params)
		@new_comment.work_out_id = params[:work_out_id]
		@new_comment.user_id = current_user.id
		if @new_comment.save
			redirect_to request.referer
		else
    		@user = @work_out.user
			render template: "work_outs/show"
		end
	end

	def destroy
		comment = Comment.find_by(work_out_id: params[:work_out_id], user_id: current_user.id)
		comment.destroy
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
