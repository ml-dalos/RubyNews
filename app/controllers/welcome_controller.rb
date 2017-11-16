class WelcomeController < ApplicationController
  def index
    redirect_to '/log_in' unless helpers.current_user
  end
end
