class OfficersController < ApplicationController
  layout 'application'
  def index
    @officers = Officer.all
  end

  def new
    @officers = Officer.new
  end

  def create
    @officers = Officer.new(officersparams)
    if @officers.save
      flash[:success] = "Data Saved Successfully"
      redirect_to officers_path
    else
      render :new
      flash[:error] = @officers.errors
    end
  end

  def show
    @officers = Officer.find(params[:id])
  end

  def edit
    @officers = Officer.find(params[:id])
  end

  def update
    @officers = Officer.find(params[:id])
    if @officers.update(officersparams)
      flash[:success] = "Data Update Successfully"
      redirect_to officers_path
    else
      render :edit
      flash[:error] = @officers.errors
    end
  end

  def destroy
    @officers = Officer.find(params[:id])
    if @officers.destroy
      flash[:success] = "Data Deleted"
    else
      render :index
      flash[:error] = @officers.delete.errors
    end
  end

  def officersparams
    params.require(:officer).permit(:svc_number, :rank, :name, :gender, :dob, :commission_date, :seniority_date)
  end
end
