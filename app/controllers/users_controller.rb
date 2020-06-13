class UsersController < ApplicationController
  skip_before_action :is_admin, only: [:show]
  skip_before_action :is_authorized, only: [:show]

  def index
    @users = params[:unauthorized].present? ? User.unauthorized_users : User.authorized_users
    @unauthorized_users_count = User.unauthorized_users.count unless params[:unauthorized].present?
  end

  def show
    @user = (current_user.is_admin && current_user.is_authorized) || current_user.creator ? User.find(params[:id]) : current_user
  end

  def switch_authorization
    @user = User.find(params[:id])
    @user.update(is_authorized: !@user.is_authorized)
    if @user.is_authorized
      Week.all.each do |week|
        week.days.create(user_id: @user.id, assigns: {mo: "", tu: "", we: "", th: "", fr: "", sa: "", su: ""}.to_json)
      end
    else
      @user.days.destroy_all
    end
  end
end
