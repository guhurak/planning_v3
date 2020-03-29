class WeeksController < ApplicationController
  def index
    @users = User.authorized_users
    @weeks = Week.all.includes(:days).order(:id)
  end

  def create
    @week = Week.create
    @users = User.authorized_users
    @users.each do |user|
      @week.days.create(user_id: user.id, assigns: {mo: "", tu: "", we: "", th: "", fr: "", sa: "", su: ""}.to_json)
    end
  end

  def destroy
    @week = Week.find(params[:id])
    @week.destroy
  end
end
