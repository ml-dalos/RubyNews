class WelcomeController < ApplicationController
  def index
    redirect_to '/login' unless helpers.current_user
  end
end
