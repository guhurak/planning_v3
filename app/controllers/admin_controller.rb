class AdminController < ApplicationController
  def index
    @users_count = User.count
    @weeks_count = Week.count
  end
end
