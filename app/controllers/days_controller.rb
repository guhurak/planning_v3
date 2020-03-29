class DaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    day = Day.find(params[:id])
    day_name = params[:day]

    assigns = JSON.parse(day.assigns)
    assigns[day_name] = params[:assign]
    day.update(assigns: assigns.to_json)

    return :ok
  end
end
