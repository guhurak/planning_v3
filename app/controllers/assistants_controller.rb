class AssistantsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    assistant = Assistant.last
    if assistant
      assistant.update(count: params[:count])
    else
      Assistant.create(count: params[:count])
    end

    return :ok
  end
end
