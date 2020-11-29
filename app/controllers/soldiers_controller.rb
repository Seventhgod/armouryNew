class SoldiersController < ApplicationController
  layout 'application'
  def index
    @soldiers = Soldier.all
  end

  def new
    @soldiers = Soldier.new
  end

  def create
    @soldiers = Soldier.new(soldierparams)
    if @soldiers.save
      flash[:success] = 'Data Saved Successfully'
      redirect_to soldiers_path
    else
      render :new
      flash[:error] = @soldiers.errors
    end
  end

  def show
    @soldiers = Soldier.find(params[:id])
  end

  def edit
    @soldiers = Soldier.find(params[:id])
  end

  def update
    @soldiers = Soldier.find(params[:id])
    if @soldiers.update(soldierparams)
      flash[:success] = "Data Updated Successfully"
      redirect_to soldiers_path
    else
      render :edit
      flash[:error] = @soldiers.update.errors
    end
  end

  def destroy
    @soldiers = Soldier.find(params[:id])
    @soldiers.destroy
    redirect_to soldiers_path
  end


  def soldierparams
    params.require(:soldier).permit(:svc_number, :rank, :name, :gender, :dob, :unit)
  end
end
