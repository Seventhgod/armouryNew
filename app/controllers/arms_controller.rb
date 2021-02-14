class ArmsController < ApplicationController
  layout 'application'
  def index
    @arms = Arm.all
    @armss = Arm.new
  end

  def new
    @arms = Arm.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @arms = Arm.new(arms_params)
    if @arms.save
      flash[:success] = "Data Added Successfully"
      redirect_to arms_path
    else
      render :new
      flash[:error] = @arms.errors
    end
  end

  def show
    @arms = Arm.find(params[:id])
  end

  def edit
    @arms = Arm.find(params[:id])
  end

  def update
    @arms = Arm.find(params[:id])
    if @arms.update(arms_params)
      flash[:success] = "Data Updated!"
      redirect_to arms_path
    else
      render :edit
      flash[:error] = @arms.errors
    end
  end

  def destroy
    @arms = Arm.find(params[:id])
    @arms.destroy
    flash[:success] = "Data Deleted Successfully"
    redirect_to arms_path
  end

  def ajaxdelete
    @arms = Arm.find(params[:id])
    @arms.destroy

    respond_to do |format|
      format.json
      format.html
    end
  end
  private
  def arms_params
    params.require(:arm).permit(:srl_num, :arm_name, :arm_type, :service_b)
  end

  def ajax_arms_params
    params.permit(:srl_num, :arm_name, :arm_type, :service_b)
  end
end
