class UsersController < ApplicationController
  def index
    @authorised_user = User.authorized_users
    @unauthorised_user = User.unauthorized_users
  end

  def show
    if current_user.is_admin && current_user.is_authorized
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
