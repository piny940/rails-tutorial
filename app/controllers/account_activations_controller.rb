class AccountActivationsController < ApplicationController
  def edit
    if user && !user.activated? && user.proper_token?(params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      login user
      redirect_to root_path, notice: "Account activated!"
    else
      redirect_to root_path, alert: "Invalid activation link"
    end
  end
end
