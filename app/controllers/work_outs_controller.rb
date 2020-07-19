class WorkOutsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @work_outs = WorkOut.all
  end

  def show
    @work_out = WorkOut.find(params[:id])
  end

  def edit; end

  def update; end

  def destroy; end

  def new
    @work_out = WorkOut.new
  end

  def create; end
end
