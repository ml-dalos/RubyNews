class WelcomeController < ApplicationController
  def index
    redirect_to '/log_in' unless helpers.current_user
  end

  def privacy
    render layout: false
  end
end
