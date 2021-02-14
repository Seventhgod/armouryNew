class ArmrequestsController < ApplicationController
  layout 'application'
  def index
    @armreq = Armrequest.all.where('return_status = ?', 'Unreturned')
    @armmsss = Armrequest.new
    @arm = Arm.all.select('arm_name')
  end

  def new
    @armreq = Armrequest.new
    @arm = Arm.all.select('arm_name')
    respond_to do |format|
      format.js
    end
  end

  def create
    @armreq = Armrequest.new(armreqparams)
    if @armreq.save
      flash[:success] = 'Request Made Successfully'
      redirect_to armrequests_path
    else
      render :new
      flash[:error] = @armreq.errors
    end
  end

  def show
    @armreq = Armrequest.find(params[:id])
  end

  def edit
    @armreq = Armrequest.find(params[:id])
    @arm = Arm.all.select('arm_name')
  end

  def update
    @armreq = Armrequest.find(params[:id])
    if @armreq.update(armreqparams)
      flash[:success] = 'Request Updated Succesfully'
      redirect_to armrequests_path
    else
      render :new
      flash[:error] = @armreq.errors
    end
  end

  def destroy
    @armreq = Armrequest.find(params[:id])
    if @armreq.destroy
      flash[:success] = 'Request Deleted'
      redirect_to armrequests_path
    else
      render :new
      flash[:error] = @armreq.errors
    end
  end

  def updatereqstat
    @armreq = Armrequest.find(params[:id])
    @armreq.return_status = params[:status]
    @armreq.return_date = Date.today.to_date
    @armreq.save
    ArmReturn.create(personnel: @armreq.personnel, arm: @armreq.arm, srl_num: @armreq.srl_num, return_date: @armreq.return_date)
  end

  def getarms
    if params[:arm].present?
      @arm_srl = Arm.where('arm_name =?', params[:arm]).select('srl_num')
    else
      @arm_srl = Arm.all
    end
    if request.xhr?
      respond_to do |format|
        format.json{
          render json: {srl_num: @arm_srl}
        }
      end
    end
  end

  def getsoldiers
    @soldier = Soldier.all
    if request.xhr?
      respond_to do |format|
        format.json{
          render json: {svc_number: @soldier}
        }
      end
    end
  end

  def getofficers
    @officer = Officer.all
    if request.xhr?
      respond_to do |format|
        format.json{
          render json: {svc_number: @officer}
        }
      end
    end
  end

  def ajaxdelete
    @armreq = Armrequest.find(params[:id])
    @armreq.destroy

    respond_to do |format|
      format.json
      format.html
    end
  end
  private
  def armreqparams
    params.require(:armrequest).permit(:personnel, :arm, :srl_num, :user, :request_date, :return_status)
  end

  def armrepams
    params.permit(:personnel, :arm, :srl_num, :user, :request_date, :return_status)
  end

end
