class AdminController < ApplicationController
  def index
    @users_count = User.where(creator: false, is_authorized: true).count
    @weeks_count = Week.count
  end
end
