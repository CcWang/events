class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attribute(:first_name, params[:first_name])
    # user.first_name(params[:first_name])
    user.update_attribute(:last_name, params[:last_name])
    user.update_attribute(:email, params[:email])
    user.update_attribute(:location, params[:location])
    user.update_attribute(:state, params[:state])
    redirect_to '/events'
  end

  
end
