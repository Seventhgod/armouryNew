class TrialController < ApplicationController
  layout 'application'

  def index
    @armss = Armrequest.order("created_at").last
    @arms = Arm.all.count
    @armreq = Armrequest.where('return_status = ?', 'Unreturned').count
    @armret = ArmReturn.all.count
    @user = User.all.count
    @armreqtime = Armrequest.where('request_date = ?', Date.today.to_date).count
  end
end
