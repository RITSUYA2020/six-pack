class CommentsController < ApplicationController

	def create
		@work_out = WorkOut.find(params[:work_out_id])
		@new_comment = Comment.new(comment_params)
		@new_comment.work_out_id = params[:work_out_id]
		@new_comment.user_id = current_user.id
		if @new_comment.save
		else
    		@user = @work_out.user
			render template: "work_outs/show"
		end
	end

	def destroy
		@comment = Comment.find(params[:work_out_id])
		@work_out = @comment.work_out
		if @comment.user != current_user
			redirect_to request.referer
		end
		@comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
