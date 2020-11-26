class ArmrequestsController < ApplicationController
  layout 'application'
  def index
    @armreq = Armrequest.all.where('return_status = ?', 'Unreturned')
  end

  def new
    @armreq = Armrequest.new
  end

  def create
    @armreq = Armrequest.new(armreqparams)
    @armcount = Arm.where('arm_name = ?', @armreq.arm).select('id', 'quantity')
    if @armreq.save
      @save = Arm.find(@armcount[0]['id'])
      @save.quantity = @armcount[0]['quantity']-1
      @save.save
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
    @armcount = Arm.where('arm_name = ?', @armreq.arm).select('id', 'quantity')
    @save = Arm.find(@armcount[0]['id'])
    @save.quantity = @armcount[0]['quantity'] + 1
    @save.save
    @armreq.return_status = params[:status]
    @armreq.return_date = Date.today.to_date
    @armreq.save
    ArmReturn.create(personnel: @armreq.personnel, arm: @armreq.arm, srl_num: @save.srl_num, return_date: @armreq.return_date)
  end

  private
  def armreqparams
    params.require(:armrequest).permit(:personnel, :arm_type, :arm, :user, :request_date, :return_status)
  end

end
