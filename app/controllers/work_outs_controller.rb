class WorkOutsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @work_outs = WorkOut.all.reverse_order
  end

  def show
    @work_out = WorkOut.find(params[:id])
    @user = @work_out.user
  end

  def edit
    @work_out = WorkOut.find(params[:id])
  end

  def update
    @work_out = WorkOut.find(params[:id])
    if @work_out.update(work_out_params)
      redirect_to work_out_path(current_user)
    else
      flash[:error] = '*の項目を入力してください。'
      render "edit"
    end
  end

  def destroy
    work_out = WorkOut.find(params[:id])
    work_out.destroy
    redirect_to work_outs_path
  end

  def new
    @work_out = WorkOut.new
  end

  def create
    @work_out = WorkOut.new(work_out_params)
    @work_out.user_id = current_user.id
    if @work_out.save
      redirect_to work_out_path(current_user)
    else
      flash[:error] = '*の項目を入力してください。'
      render "new"
    end
  end

  private
  def work_out_params
    params.require(:work_out).permit(:time, :muscle_group, :muscle_group, :body, :effect, :place, :before_image, :after_image)
  end
end
